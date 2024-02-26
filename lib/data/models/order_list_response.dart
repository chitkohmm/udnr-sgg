import 'package:libms_flutter/data/models/book/books.dart';

/// data : [{"id":26,"issue_date":null,"return_date":null,"user_id":2,"status":"0","formattedIssueDate":"13-Feb-2023","user":{"id":2,"name":"Aung Pyae","email":"aungpyae@edu.mm","email_verified_at":null,"approved":1},"books":[{"id":1,"location_id":1,"floor":"2850","row_no":"1120","column_no":"2237","shelf_id":1,"book_cover":"https://lib-ms.hmmdemo.net/bookcovers/63e901cf40073hardcopy.jpg","limit_qty":20,"status":"1","reading_duration":5,"bookname":"Dormouse's place.","author_name":"Corbin McKenzie","description":"Debitis suscipit quam blanditiis quo iusto ab.","isbn_code":"2670565","qty":17,"book_type_id":1,"numberofpages":"34","edition":"Voluptates placeat hic aut.","issue_date":"1989-08-03","bookfile":[{"original_url":"https://lib-ms.hmmdemo.net/storage/11/63e901a417ce0_internals_widget_categories.pdf"}],"pivot":{"issued_return_id":26,"book_id":1,"status":"0","issue_date":"2023-02-13","return_date":"2023-02-18"}}]}]

class OrderListResponse {
  OrderListResponse({
    this.data,
  });

  OrderListResponse.fromJson(dynamic json) {
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
  }
  List<Data>? data;
  OrderListResponse copyWith({
    List<Data>? data,
  }) =>
      OrderListResponse(
        data: data ?? this.data,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// id : 26
/// issue_date : null
/// return_date : null
/// user_id : 2
/// status : "0"
/// formattedIssueDate : "13-Feb-2023"
/// user : {"id":2,"name":"Aung Pyae","email":"aungpyae@edu.mm","email_verified_at":null,"approved":1}
/// books : [{"id":1,"location_id":1,"floor":"2850","row_no":"1120","column_no":"2237","shelf_id":1,"book_cover":"https://lib-ms.hmmdemo.net/bookcovers/63e901cf40073hardcopy.jpg","limit_qty":20,"status":"1","reading_duration":5,"bookname":"Dormouse's place.","author_name":"Corbin McKenzie","description":"Debitis suscipit quam blanditiis quo iusto ab.","isbn_code":"2670565","qty":17,"book_type_id":1,"numberofpages":"34","edition":"Voluptates placeat hic aut.","issue_date":"1989-08-03","bookfile":[{"original_url":"https://lib-ms.hmmdemo.net/storage/11/63e901a417ce0_internals_widget_categories.pdf"}],"pivot":{"issued_return_id":26,"book_id":1,"status":"0","issue_date":"2023-02-13","return_date":"2023-02-18"}}]

class Data {
  Data({
    this.id,
    this.issueDate,
    this.returnDate,
    this.userId,
    this.status,
    this.formattedIssueDate,
    this.user,
    this.books,
  });

  Data.fromJson(dynamic json) {
    id = json['id'];
    issueDate = json['issue_date'];
    returnDate = json['return_date'];
    userId = json['user_id'];
    status = json['status'];
    formattedIssueDate = json['formattedIssueDate'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    if (json['books'] != null) {
      books = [];
      json['books'].forEach((v) {
        books?.add(Book.fromJson(v));
      });
    }
  }
  num? id;
  dynamic issueDate;
  dynamic returnDate;
  num? userId;
  String? status;
  String? formattedIssueDate;
  User? user;
  List<Book>? books;
  Data copyWith({
    num? id,
    dynamic issueDate,
    dynamic returnDate,
    num? userId,
    String? status,
    String? formattedIssueDate,
    User? user,
    List<Book>? books,
  }) =>
      Data(
        id: id ?? this.id,
        issueDate: issueDate ?? this.issueDate,
        returnDate: returnDate ?? this.returnDate,
        userId: userId ?? this.userId,
        status: status ?? this.status,
        formattedIssueDate: formattedIssueDate ?? this.formattedIssueDate,
        user: user ?? this.user,
        books: books ?? this.books,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['issue_date'] = issueDate;
    map['return_date'] = returnDate;
    map['user_id'] = userId;
    map['status'] = status;
    map['formattedIssueDate'] = formattedIssueDate;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    if (books != null) {
      map['books'] = books?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// id : 1
/// location_id : 1
/// floor : "2850"
/// row_no : "1120"
/// column_no : "2237"
/// shelf_id : 1
/// book_cover : "https://lib-ms.hmmdemo.net/bookcovers/63e901cf40073hardcopy.jpg"
/// limit_qty : 20
/// status : "1"
/// reading_duration : 5
/// bookname : "Dormouse's place."
/// author_name : "Corbin McKenzie"
/// description : "Debitis suscipit quam blanditiis quo iusto ab."
/// isbn_code : "2670565"
/// qty : 17
/// book_type_id : 1
/// numberofpages : "34"
/// edition : "Voluptates placeat hic aut."
/// issue_date : "1989-08-03"
/// bookfile : [{"original_url":"https://lib-ms.hmmdemo.net/storage/11/63e901a417ce0_internals_widget_categories.pdf"}]
/// pivot : {"issued_return_id":26,"book_id":1,"status":"0","issue_date":"2023-02-13","return_date":"2023-02-18"}

/// issued_return_id : 26
/// book_id : 1
/// status : "0"
/// issue_date : "2023-02-13"
/// return_date : "2023-02-18"

class Pivot {
  Pivot({
    this.issuedReturnId,
    this.bookId,
    this.status,
    this.issueDate,
    this.returnDate,
  });

  Pivot.fromJson(dynamic json) {
    issuedReturnId = json['issued_return_id'];
    bookId = json['book_id'];
    status = json['status'];
    issueDate = json['issue_date'];
    returnDate = json['return_date'];
  }
  num? issuedReturnId;
  num? bookId;
  String? status;
  String? issueDate;
  String? returnDate;
  Pivot copyWith({
    num? issuedReturnId,
    num? bookId,
    String? status,
    String? issueDate,
    String? returnDate,
  }) =>
      Pivot(
        issuedReturnId: issuedReturnId ?? this.issuedReturnId,
        bookId: bookId ?? this.bookId,
        status: status ?? this.status,
        issueDate: issueDate ?? this.issueDate,
        returnDate: returnDate ?? this.returnDate,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['issued_return_id'] = issuedReturnId;
    map['book_id'] = bookId;
    map['status'] = status;
    map['issue_date'] = issueDate;
    map['return_date'] = returnDate;
    return map;
  }
}

/// original_url : "https://lib-ms.hmmdemo.net/storage/11/63e901a417ce0_internals_widget_categories.pdf"

class Bookfile {
  Bookfile({
    this.originalUrl,
  });

  Bookfile.fromJson(dynamic json) {
    originalUrl = json['original_url'];
  }
  String? originalUrl;
  Bookfile copyWith({
    String? originalUrl,
  }) =>
      Bookfile(
        originalUrl: originalUrl ?? this.originalUrl,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['original_url'] = originalUrl;
    return map;
  }
}

/// id : 2
/// name : "Aung Pyae"
/// email : "aungpyae@edu.mm"
/// email_verified_at : null
/// approved : 1

class User {
  User({
    this.id,
    this.name,
    this.email,
    this.emailVerifiedAt,
    this.approved,
  });

  User.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    approved = json['approved'];
  }
  num? id;
  String? name;
  String? email;
  dynamic emailVerifiedAt;
  num? approved;
  User copyWith({
    num? id,
    String? name,
    String? email,
    dynamic emailVerifiedAt,
    num? approved,
  }) =>
      User(
        id: id ?? this.id,
        name: name ?? this.name,
        email: email ?? this.email,
        emailVerifiedAt: emailVerifiedAt ?? this.emailVerifiedAt,
        approved: approved ?? this.approved,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['email'] = email;
    map['email_verified_at'] = emailVerifiedAt;
    map['approved'] = approved;
    return map;
  }
}
