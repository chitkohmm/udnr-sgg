import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:libms_flutter/ui/download_books/download_books.dart';
import 'package:libms_flutter/ui/home/home.dart';
import 'package:libms_flutter/ui/library/library.dart';
import 'package:libms_flutter/ui/profile/profile.dart';
import 'package:libms_flutter/ui/video/video.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key, required this.index}) : super(key: key);
  final int index;
  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _currentIndex = 0;
  void _onChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  void initState() {
    _currentIndex = widget.index;
    super.initState();
  }

  final List<Widget> _screens = [
    const Home(),
    const DownloadBooks(),
    const Library(),
    const Video(),
    const Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      child: Scaffold(
        body: _screens[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: _onChanged,
          fixedColor: const Color(0xFF5AE4A8),
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.book), label: "Your Books"),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.down_arrow), label: "Download"),
            BottomNavigationBarItem(
                icon: Icon(Icons.local_library_rounded), label: "Library"),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.video_camera), label: "Videos"),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.person_alt), label: "Profile"),
          ],
        ),
      ),
    );
  }
}
