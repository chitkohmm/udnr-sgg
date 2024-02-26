/// books : {"book_id":"2","status":"1"}

class RequestBook {
  RequestBook({
    this.books,
  });

  RequestBook.fromJson(dynamic json) {
    books = json['books'] != null ? BookObject.fromJson(json['books']) : null;
  }
  BookObject? books;
  RequestBook copyWith({
    BookObject? books,
  }) =>
      RequestBook(
        books: books ?? this.books,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (books != null) {
      map['books'] = books?.toJson();
    }
    return map;
  }
}

/// book_id : "2"
/// status : "1"

class BookObject {
  BookObject({
    this.bookId,
  });

  BookObject.fromJson(dynamic json) {
    bookId = json['book_id'];
  }
  String? bookId;
  BookObject copyWith({
    String? bookId,
  }) =>
      BookObject(
        bookId: bookId ?? this.bookId,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['book_id'] = bookId;
    return map;
  }
}
