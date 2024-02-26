// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:flutter_pdfview/flutter_pdfview.dart';
// import 'package:encrypt/encrypt.dart' as en;
// import 'package:path_provider/path_provider.dart';
//
// class PdfViewFlutter extends StatefulWidget {
//   const PdfViewFlutter({Key? key, required this.file, required this.bookName})
//       : super(key: key);
//   final String file;
//   final String bookName;

//   @override
//   State<PdfViewFlutter> createState() => _PdfViewFlutterState();
// }
//
// class _PdfViewFlutterState extends State<PdfViewFlutter> {
//   Future<File> _readEncryptedFile(String filePath) async {
//     final key =
//         en.Key.fromBase64("6siFZtw4sG+OaZZE1icHwV8ncbzHBynv57OM3sC0vtc=");
//     final iv = en.IV.fromLength(16);
//     final encrypter = en.Encrypter(en.AES(key));
//
//     File file = File(filePath);
//
//     var bytes = await file.readAsBytes();
//     var decrypted = encrypter.decryptBytes(en.Encrypted(bytes), iv: iv);
//
//     var temp =
//         '${(await getTemporaryDirectory()).path}/${DateTime.now().millisecondsSinceEpoch}';
//     File tempFile = File(temp);
//
//     await tempFile.writeAsBytes(decrypted);
//     return tempFile;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           elevation: 0,
//           backgroundColor: Colors.white,
//           leading: GestureDetector(
//             onTap: () {
//               Navigator.pop(context);
//             },
//             child: Icon(
//               Icons.arrow_back_ios_rounded,
//               color: Colors.grey.shade700,
//             ),
//           ),
//           title: Text(
//             widget.bookName.toString().toUpperCase(),
//             style: const TextStyle(
//                 color: Colors.black, fontWeight: FontWeight.w700),
//           ),
//         ),
//         body: );
//   }
// }
