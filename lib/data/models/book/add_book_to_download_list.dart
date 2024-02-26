import 'request_book.dart';

/// user_id : 2
/// status : "1"
/// books : {"book_id":"2","status":"1"}

class AddBookToDownloadList {
  AddBookToDownloadList({
    this.userId,
    this.status,
    this.books,
  });

  AddBookToDownloadList.fromJson(dynamic json) {
    userId = json['user_id'];
    status = json['status'];
    books = json['books'] != null ? BookObject.fromJson(json['books']) : null;
  }
  num? userId;
  String? status;
  BookObject? books;
  
  AddBookToDownloadList copyWith({
    num? userId,
    String? status,
    BookObject? books,
  }) =>
      AddBookToDownloadList(
        userId: userId ?? this.userId,
        status: status ?? this.status,
        books: books ?? this.books,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['user_id'] = userId;
    map['status'] = status;
    if (books != null) {
      map['books'] = books?.toJson();
    }
    return map;
  }
}

/// book_id : "2"
/// status : "1"
