import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class DownloadDetail extends StatefulWidget {
  final String url;
  const DownloadDetail({Key? key, required this.url}) : super(key: key);

  @override
  State<DownloadDetail> createState() => _DownloadDetailState();
}

class _DownloadDetailState extends State<DownloadDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
        ),
        body: PDFView(
          filePath: File(widget.url).path,
        ));
  }
}
