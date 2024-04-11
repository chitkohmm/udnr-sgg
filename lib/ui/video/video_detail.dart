import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:libms_flutter/domain/storage_utils.dart';
import 'package:video_player/video_player.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class VideoApp extends StatefulWidget {
  const VideoApp({super.key, required this.videoLink, required this.videoId});

  final String videoLink;
  final String videoId;

  @override
  State<VideoApp> createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> {
  late VideoPlayerController _controller;
  //Video Error
  late bool _isVideoError = false;

  @override
  void initState() {
    super.initState();

    debugPrint("Video Link :____ ${widget.videoLink}");

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);

    _controller = VideoPlayerController.networkUrl(
      //  Uri.parse(
      //      'https://v3.cdnpk.net/videvo_files/video/free/2019-11/large_preview/190301_1_25_11.mp4'), // <<-- test online video
      Uri.parse(widget.videoLink),
      videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true),
    );

    _controller.addListener(() {
      setState(() {});
    });
    // _controller.initialize();

    _controller.initialize().then((_) {
      // Video successfully loaded
      setState(() {
        _isVideoError = false;
      });
    }).catchError((error) {
      // Handle video initialization error
      setState(() {
        _isVideoError = true;
      });
      _showErrorDialog();
    });
  }

  void _showErrorDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Error'),
          content: const Text('Unable to play the video.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    MediaQuery.of(context).orientation == Orientation.landscape
        ? SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
            overlays: [SystemUiOverlay.bottom])
        : SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
            overlays: [SystemUiOverlay.top]);
  }

  @override
  void dispose() {
    _controller.dispose();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: MediaQuery.of(context).orientation == Orientation.landscape
          ? null
          : AppBar(
              iconTheme: const IconThemeData(color: Colors.white),
              elevation: 0,
              backgroundColor: Colors.transparent,
              title: const Text(
                "Videos",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
              ),
            ),
      body: Center(
        child: _controller.value.isInitialized
            ? AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    VideoPlayer(_controller),
                    _ControlsOverlay(
                      controller: _controller,
                      videoId: widget.videoId,
                    ),
                    VideoProgressIndicator(_controller, allowScrubbing: true),
                  ],
                ),
              )
            : const Center(
                child: SpinKitThreeBounce(
                  color: Color(0xFF5AE4A8),
                  size: 22,
                ),
              ),
      ),
    );
  }
}

class _ControlsOverlay extends StatelessWidget {
  const _ControlsOverlay({required this.controller, required this.videoId});

  static const List<double> _examplePlaybackRates = <double>[
    0.5,
    1.0,
    1.5,
    2.0,
  ];

  final VideoPlayerController controller;
  final String videoId;

  Future<void> _postViewCount() async {
    final Dio dio = Dio();
    dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90));

    await Future<void>.delayed(const Duration(milliseconds: 250));

    await dio.post(
      "${StorageUtils.getString("url")}/api/v1/register-view",
      options: Options(headers: {
        "Authorization": 'Bearer ${StorageUtils.getString("login_user")}'
      }),
      data: {
        "user_id": int.parse(StorageUtils.getString("user_id")),
        "video_id": videoId
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 50),
          reverseDuration: const Duration(milliseconds: 200),
          child: controller.value.isBuffering
              ? const SpinKitThreeBounce(
                  color: Color(0xFF5AE4A8),
                  size: 22,
                )
              : controller.value.isPlaying
                  ? const SizedBox.shrink()
                  : !controller.value.isPlaying
                      ? const Center(
                          child: Icon(
                            Icons.play_arrow,
                            color: Color(0xFF5AE4A8),
                            size: 100.0,
                            semanticLabel: 'Play',
                          ),
                        )
                      : const SizedBox.shrink(),
        ),
        GestureDetector(
          onTap: () {
            controller.value.isPlaying ? controller.pause() : controller.play();
            _postViewCount();
          },
        ),
        Align(
          alignment: Alignment.topRight,
          child: PopupMenuButton<double>(
            initialValue: controller.value.playbackSpeed,
            tooltip: 'Playback speed',
            onSelected: (double speed) {
              controller.setPlaybackSpeed(speed);
            },
            itemBuilder: (BuildContext context) {
              return <PopupMenuItem<double>>[
                for (final double speed in _examplePlaybackRates)
                  PopupMenuItem<double>(
                    value: speed,
                    child: Text('${speed}x'),
                  )
              ];
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(
                // Using less vertical padding as the text is also longer
                // horizontally, so it feels like it would need more spacing
                // horizontally (matching the aspect ratio of the video).
                vertical: 12,
                horizontal: 16,
              ),
              child: Text('${controller.value.playbackSpeed}x'),
            ),
          ),
        ),
      ],
    );
  }
}
