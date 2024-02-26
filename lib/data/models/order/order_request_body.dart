/// user_id : 2
/// books : {"book_id":3,"issue_date":"2020-01-2","return_date":"2020-01-20"}

class OrderRequestBody {
  OrderRequestBody({
    this.userId,
    this.books,
  });

  OrderRequestBody.fromJson(dynamic json) {
    userId = json['user_id'];
    books = json['books'] != null ? OrderBook.fromJson(json['books']) : null;
  }
  num? userId;
  OrderBook? books;
  OrderRequestBody copyWith({
    num? userId,
    OrderBook? books,
  }) =>
      OrderRequestBody(
        userId: userId ?? this.userId,
        books: books ?? this.books,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['user_id'] = userId;
    if (books != null) {
      map['books'] = books?.toJson();
    }
    return map;
  }
}

/// book_id : 3
/// issue_date : "2020-01-2"
/// return_date : "2020-01-20"

class OrderBook {
  OrderBook({
    this.bookId,
    this.issueDate,
    this.returnDate,
    this.status,
  });

  OrderBook.fromJson(dynamic json) {
    bookId = json['book_id'];
    issueDate = json['issue_date'];
    returnDate = json['return_date'];
    status = json['status'];
  }
  num? bookId;
  String? issueDate;
  String? returnDate;
  String? status;
  OrderBook copyWith({
    num? bookId,
    String? issueDate,
    String? returnDate,
    String? status,
  }) =>
      OrderBook(
        bookId: bookId ?? this.bookId,
        issueDate: issueDate ?? this.issueDate,
        returnDate: returnDate ?? this.returnDate,
        status: status ?? this.status,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['book_id'] = bookId;
    map['issue_date'] = issueDate;
    map['return_date'] = returnDate;
    map['status'] = status;
    return map;
  }
}
