import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../models/book_file.dart';

class SqliteClient {
  static const String _downloadBooks = "download_books";

  static Future<SqliteClient?> getInstance() async {
    var secureStorage = SqliteClient._();
    await secureStorage._init();
    _storageUtil = secureStorage;
    return _storageUtil;
  }

  SqliteClient._();
  static SqliteClient? _storageUtil;
  static Database? database;

  Future<void> _init() async {
    String path = join(await getDatabasesPath(), 'libms.db');
    var exist = await databaseExists(path);
    if (!exist) {
      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (_) {}
      ByteData data = await rootBundle.load("assets/db/libms.db");
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      await File(path).writeAsBytes(bytes, flush: true);
    }
    database = await openDatabase(path);
  }

  static Future<void> saveBookFile({required BookFile bookFile}) async {
    await database!.insert(_downloadBooks, bookFile.toJson());
  }

  static Future<List<BookFile>> getBookFile() async {
    List<BookFile> bookFiles = [];

    List<Map<String, dynamic>> data = await database!.query(
      _downloadBooks,
    );

    for (var book in data) {
      bookFiles.add(BookFile.fromJson(book));
    }

    return bookFiles;
  }

  static Future<bool> checkBookExistence(int bookId) async {
    final list = await database!
        .query(_downloadBooks, where: "book_id = ?", whereArgs: [bookId]);
    if (list.isEmpty) {
      return false;
    } else {
      return true;
    }
  }

  static Future<int> deleteBook(int bookId) async {
    return await database!
        .delete(_downloadBooks, where: "book_id = ?", whereArgs: [bookId]);
  }

  static Future<int> removeAllBooks() async {
    return await database!.delete(_downloadBooks);
  } 
}
