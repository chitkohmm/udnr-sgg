import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../data/blocs/book_bloc/book_bloc.dart';
import '../../data/models/book/books.dart';
import '../../data/models/book/current_book_count.dart';
import '../../data/models/book_file.dart';
import '../../data/network/sqlite_client.dart';
import '../../domain/constants.dart';
import '../../domain/storage_utils.dart';
import '../bottom_nav_bar/bottom_nav_bar.dart';
import 'success_page.dart';
import 'widgets/widgets.dart';

class BookDetail extends StatefulWidget {
  const BookDetail({Key? key, required this.book}) : super(key: key);
  final Book book;

  @override
  State<BookDetail> createState() => _BookDetailState();
}

class _BookDetailState extends State<BookDetail> {
  DateTime borrowDate = DateTime.now();
  DateTime returnDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: borrowDate,
        firstDate: DateTime(2023, 1),
        lastDate: DateTime(2200));
    if (picked != null && picked != borrowDate) {
      setState(() {
        returnDate =
            picked.add(Duration(days: widget.book.readingDuration!.toInt()));
        borrowDate = picked;
      });
    }
  }

  Future<File> _downloadFile(String fileName) async {
    final pdfUrl = '${widget.book.bookfile?[0].originalUrl}';
    debugPrint('PDF URL ----- ${widget.book.bookfile?[0].originalUrl}');

    var response = await http.get(Uri.parse(pdfUrl));

    var filePath = '${(await getTemporaryDirectory()).path}/$fileName';
    File file = File(filePath);
    await file.writeAsBytes(response.bodyBytes);
    return file;
  }

  Future<File> _downloadPhoto(String url, String fileName) async {
    var response = await http.get(Uri.parse(url));
    var filePath = '${(await getTemporaryDirectory()).path}/$fileName.png';

    debugPrint('Photo download $url');

    File file = File(filePath);
    await file.writeAsBytes(response.bodyBytes);
    return file;
  }

  @override
  void initState() {
    returnDate =
        returnDate.add(Duration(days: widget.book.readingDuration!.toInt()));
    super.initState();
  }

  bool isDownloading = false;
  @override
  Widget build(BuildContext context) {
    debugPrint('Book status :: ${widget.book.status} ');

    return PopScope(
      canPop: isDownloading ? false : true,
      onPopInvoked: (_) {
        if (isDownloading) {
          ScaffoldMessenger.of(context).clearSnackBars();
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text('Please wait until download finished')));
        }
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios_rounded,
              color: Colors.grey.shade700,
            ),
          ),
          title: Text(
            widget.book.bookname.toString().toUpperCase(),
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: kDeviceWidth(context) * 0.04),
            maxLines: 2,
          ),
        ),
        body: SafeArea(
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: 10.0,
                    left: 10,
                    right: 10,
                    bottom: MediaQuery.of(context).size.height / 6),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      _buildUpperSection(
                          widget.book.bookCover.toString(), context),
                      widget.book.description == null
                          ? const SizedBox()
                          : _buildMiddleSection(
                              context, widget.book.status ?? ''),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02),
                    ],
                  ),
                ),
              ),
              Align(
                  alignment: Alignment.bottomCenter,
                  child: _buildBottomSection(
                      context, widget.book.status.toString()))
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildUpperSection(String imgPath, BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Align(
          alignment: Alignment.center,
          child: Container(
            clipBehavior: Clip.antiAlias,
            height: 200,
            decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(10)),
            child: CachedNetworkImage(
              imageUrl: imgPath,
              errorWidget: (context, child, _) {
                return Container(
                  color: Colors.grey.shade400,
                );
              },
            ),
          ),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.01),
        Text(
          "Book by ${widget.book.authorName}",
          maxLines: 2,
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
        ),
        _buildRowInfo("Duration", "${widget.book.readingDuration}\tdays"),
        widget.book.status == "0"
            ? const SizedBox()
            : widget.book.qty!.toInt() <= 0 ||
                    widget.book.qty!.toInt() -
                            widget.book.checkLimitQty!.toInt() ==
                        0
                ? const Text("Unavailable")
                : _buildRowInfo("Available Stock", "${widget.book.qty}"),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.02,
        ),
      ],
    );
  }

  Widget _buildMiddleSection(BuildContext context, String status) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Description",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
            ),
            status == '2'
                ? CustomTextButton(
                    book: widget.book, isDownloading: isDownloading)
                : const SizedBox.shrink(),
          ],
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.01),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            '${widget.book.description}',
            style: const TextStyle(height: 1.5),
          ),
        )
      ],
    );
  }

  Widget _buildBottomSection(BuildContext context, String status) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(color: Colors.black12, blurRadius: 4, spreadRadius: 1)
          ],
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(18), topRight: Radius.circular(18))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            status == "1" || status == '2'

                ///[0 - soft copy] [1 - hard copy]
                ? Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                              child: InkWell(
                            onTap: () => _selectDate(context),
                            child: DateWidget(
                                title: "Borrow Date", dateTime: borrowDate),
                          )),
                          Expanded(
                              child: DateWidget(
                                  title: "Return Date",
                                  dateTime: returnDate,
                                  titleColor: Colors.red)),
                        ],
                      ),
                      SizedBox(height: kDeviceHeight(context) * 0.03),
                    ],
                  )
                : const SizedBox(),

            ///[Order/Download Button]
            BlocConsumer<BookBloc, BookState>(
              builder: (context, state) {
                if (state is BookLoadingState) {
                  return InkWell(
                    onTap: null,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color(0xFF5AE4A8)),
                      child: Center(
                        child: SpinKitThreeBounce(
                          color: Colors.grey.shade900,
                          size: 20,
                        ),
                      ),
                    ),
                  );
                }

                return status == "0"
                    ? DownloadButton(
                        book: widget.book,
                        isDownloading: isDownloading,
                      )
                    : OrderButton(
                        book: widget.book,
                        borrowDate: borrowDate,
                        returnDate: returnDate);
              },
              listener: (context, state) async {
                if (state is BookLoadedState) {
                  if (state.status == "1") {
                    kGoToNext(context, const SuccessPage());
                  } else if (state.status == "0") {
                    setState(() {
                      isDownloading = true;
                    });
                    Fluttertoast.showToast(msg: "Downloading...");

                    var file =
                        await _downloadFile('${widget.book.bookname}.pdf');

                    var photo = await _downloadPhoto(
                        widget.book.bookCover.toString(),
                        '${widget.book.bookname}');

                    await SqliteClient.saveBookFile(
                        bookFile: BookFile(
                            filePath: file.path,
                            cover: photo.path,
                            bookName: widget.book.bookname,
                            bookId: widget.book.id!.toInt(),
                            author: widget.book.authorName));
                    setState(() {
                      isDownloading = false;
                    });
                    Fluttertoast.showToast(msg: "Downloaded");
                  }
                }
                if (state is BookErrorState) {
                  if (state.statusCode == 401) {
                    Fluttertoast.showToast(
                        msg: "This book can't be ordered anymore.");
                  }
                }
                if (state is DownloadBookErrorState) {
                  if (state.statusCode == 401) {
                    bool bookExistence = await SqliteClient.checkBookExistence(
                        widget.book.id!.toInt());
                    if (bookExistence == false) {
                      setState(() {
                        isDownloading = true;
                      });
                      Fluttertoast.showToast(msg: "Downloading...");

                      var file =
                          await _downloadFile('${widget.book.bookname}.pdf');

                      var photo = await _downloadPhoto(
                          widget.book.bookCover.toString(),
                          '${widget.book.bookname}');

                      await SqliteClient.saveBookFile(
                          bookFile: BookFile(
                              bookId: widget.book.id!.toInt(),
                              filePath: file.path,
                              cover: photo.path,
                              bookName: widget.book.bookname,
                              author: widget.book.authorName));
                      setState(() {
                        isDownloading = false;
                      });
                      Fluttertoast.showToast(msg: "Downloaded");
                    } else {
                      Fluttertoast.showToast(msg: "Already downloaded.");
                    }
                  }
                }
              },
            )
          ],
        ),
      ),
    );
  }

  Widget _buildRowInfo(String label, String data) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Text("$label:\t"), Text(data)],
    );
  }
}

class FailedWidget extends StatelessWidget {
  const FailedWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("You've reached the limit."),
            const SizedBox(
              height: 12,
            ),
            GestureDetector(
              onTap: () {
                kGoToNextAndRemove(
                    context,
                    const BottomNavBar(
                      index: 0,
                    ));
              },
              child: Container(
                height: 45,
                width: 120,
                decoration: BoxDecoration(
                    color: const Color(0xFF5AE4A8),
                    borderRadius: BorderRadius.circular(12)),
                child: const Center(
                  child: Text("Go Back"),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ValidateStudent extends StatefulWidget {
  const ValidateStudent({Key? key, required this.book}) : super(key: key);
  final Book book;

  @override
  State<ValidateStudent> createState() => _ValidateStudentState();
}

class _ValidateStudentState extends State<ValidateStudent> {
  Future<CurrentBookCount> _fetchApi() async {
    final Dio dio = Dio();
    dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90));
    final response = await dio.post(
        "${StorageUtils.getString("url")}/api/v1/issuedcount",
        options: Options(headers: {
          "Authorization": 'Bearer ${StorageUtils.getString("login_user")}'
        }),
        data: {"user_id": int.parse(StorageUtils.getString("user_id"))});
    return CurrentBookCount.fromJson(response.data);
  }

  @override
  void initState() {
    WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((timeStamp) {
      _fetchApi().then((value) {
        if (value.count!.toInt() >= 3) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const FailedWidget()));
        } else if (value.count!.toInt() < 3) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => BookDetail(book: widget.book)));
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SpinKitThreeBounce(
          size: 22,
          color: Color(0xFF5AE4A8),
        ),
      ),
    );
  }
}
