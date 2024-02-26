import '../book/books.dart';

/// book_category : "Flutter"
/// data : [{"id":3,"location_id":3,"floor":"1","row_no":"1","column_no":"1","shelf_id":3,"book_cover":"bookcovers/63e333a4e06e641JYUm-Qn2L._SY291_BO1,204,203,200_QL40_FMwebp_.webp","limit_qty":19,"status":"0","reading_duration":3,"bookname":"Beginning App Development with Flutter","author_name":"Rap Payne","description":"Create iOS and Android apps with Flutter using just one codebase.  App development on multiple platforms has historically been difficult and complex. This book breaks down complex concepts and tasks into easily digestible segments with examples, pictures, and hands-on labs with starters and solutions.   In doing so, you'll develop a basic understanding of the Dart programming language; the entire Flutter development toolchain; the differences between stateful and stateless widgets; and a working knowledge of the architecture of apps. All the most important parts of app development with Flutter are covered in this book. Work with themes and styles. Develop custom widgets. Teach your app to respond to gestures like taps, swipes, and pinches. Design, create and control the layout of your app. Create tools to handle form data entry from users. And ultimately create killer multiscreen apps with navigation, menus, and tabs.  Flutter is Google's new framework for creating mobile apps that run on iOS and Android phones both.You had to be a super-developer to write apps for iOS or Android alone. But writing for both? Forget about it! You had to be familiar with Swift, Java/Kotlin, Xcode, Eclipse, and a bunch of other technologies simultaneously. Beginning App Development with Flutter simplifies the entire process.","isbn_code":"70652","qty":19,"book_type_id":5,"numberofpages":"250","edition":"1st","issue_date":"2023-02-08T00:00:00.000000Z"}]

class BooksByCategory {
  BooksByCategory({
    this.bookCategory,
    this.data,
  });

  BooksByCategory.fromJson(dynamic json) {
    bookCategory = json['book_category'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Book.fromJson(v));
      });
    }
  }
  String? bookCategory;
  List<Book>? data;
  BooksByCategory copyWith({
    String? bookCategory,
    List<Book>? data,
  }) =>
      BooksByCategory(
        bookCategory: bookCategory ?? this.bookCategory,
        data: data ?? this.data,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['book_category'] = bookCategory;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// id : 3
/// location_id : 3
/// floor : "1"
/// row_no : "1"
/// column_no : "1"
/// shelf_id : 3
/// book_cover : "bookcovers/63e333a4e06e641JYUm-Qn2L._SY291_BO1,204,203,200_QL40_FMwebp_.webp"
/// limit_qty : 19
/// status : "0"
/// reading_duration : 3
/// bookname : "Beginning App Development with Flutter"
/// author_name : "Rap Payne"
/// description : "Create iOS and Android apps with Flutter using just one codebase.  App development on multiple platforms has historically been difficult and complex. This book breaks down complex concepts and tasks into easily digestible segments with examples, pictures, and hands-on labs with starters and solutions.   In doing so, you'll develop a basic understanding of the Dart programming language; the entire Flutter development toolchain; the differences between stateful and stateless widgets; and a working knowledge of the architecture of apps. All the most important parts of app development with Flutter are covered in this book. Work with themes and styles. Develop custom widgets. Teach your app to respond to gestures like taps, swipes, and pinches. Design, create and control the layout of your app. Create tools to handle form data entry from users. And ultimately create killer multiscreen apps with navigation, menus, and tabs.  Flutter is Google's new framework for creating mobile apps that run on iOS and Android phones both.You had to be a super-developer to write apps for iOS or Android alone. But writing for both? Forget about it! You had to be familiar with Swift, Java/Kotlin, Xcode, Eclipse, and a bunch of other technologies simultaneously. Beginning App Development with Flutter simplifies the entire process."
/// isbn_code : "70652"
/// qty : 19
/// book_type_id : 5
/// numberofpages : "250"
/// edition : "1st"
/// issue_date : "2023-02-08T00:00:00.000000Z"

class Data {
  Data({
    this.id,
    this.locationId,
    this.floor,
    this.rowNo,
    this.columnNo,
    this.shelfId,
    this.bookCover,
    this.limitQty,
    this.status,
    this.readingDuration,
    this.bookname,
    this.authorName,
    this.description,
    this.isbnCode,
    this.qty,
    this.bookTypeId,
    this.numberofpages,
    this.edition,
    this.issueDate,
    this.bookfile,
    this.bookfileUrl,
  });

  Data.fromJson(dynamic json) {
    id = json['id'];
    locationId = json['location_id'];
    floor = json['floor'];
    rowNo = json['row_no'];
    columnNo = json['column_no'];
    shelfId = json['shelf_id'];
    bookCover = json['book_cover'];
    limitQty = json['limit_qty'];
    status = json['status'];
    readingDuration = json['reading_duration'];
    bookname = json['bookname'];
    authorName = json['author_name'];
    description = json['description'];
    isbnCode = json['isbn_code'];
    qty = json['qty'];
    bookTypeId = json['book_type_id'];
    numberofpages = json['numberofpages'];
    edition = json['edition'];
    issueDate = json['issue_date'];
    if (json['bookfile'] != null) {
      bookfile = [];
      json['bookfile'].forEach((v) {
        bookfile?.add(Bookfile.fromJson(v));
      });
    }
    bookfileUrl = json["bookfile_url"];
  }

  num? id;
  num? locationId;
  String? floor;
  String? rowNo;
  String? columnNo;
  num? shelfId;
  String? bookCover;
  num? limitQty;
  String? status;
  num? readingDuration;
  String? bookname;
  String? authorName;
  String? description;
  String? isbnCode;
  num? qty;
  num? bookTypeId;
  String? numberofpages;
  String? edition;
  String? issueDate;

  List<Bookfile>? bookfile;
  // Bookfile? bookfile;
  String? bookfileUrl;


  Data copyWith({
    num? id,
    num? locationId,
    String? floor,
    String? rowNo,
    String? columnNo,
    num? shelfId,
    String? bookCover,
    num? limitQty,
    String? status,
    num? readingDuration,
    String? bookname,
    String? authorName,
    String? description,
    String? isbnCode,
    num? qty,
    num? bookTypeId,
    String? numberofpages,
    String? edition,
    String? issueDate,

    List<Bookfile>? bookfile,
  // Bookfile? bookfile;
  String? bookfileUrl,
  }) =>
      Data(
        id: id ?? this.id,
        locationId: locationId ?? this.locationId,
        floor: floor ?? this.floor,
        rowNo: rowNo ?? this.rowNo,
        columnNo: columnNo ?? this.columnNo,
        shelfId: shelfId ?? this.shelfId,
        bookCover: bookCover ?? this.bookCover,
        limitQty: limitQty ?? this.limitQty,
        status: status ?? this.status,
        bookfile: bookfile ?? this.bookfile,
        bookfileUrl: bookfileUrl ?? this.bookfileUrl,
        readingDuration: readingDuration ?? this.readingDuration,
        bookname: bookname ?? this.bookname,
        authorName: authorName ?? this.authorName,
        description: description ?? this.description,
        isbnCode: isbnCode ?? this.isbnCode,
        qty: qty ?? this.qty,
        bookTypeId: bookTypeId ?? this.bookTypeId,
        numberofpages: numberofpages ?? this.numberofpages,
        edition: edition ?? this.edition,
        issueDate: issueDate ?? this.issueDate,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['location_id'] = locationId;
    map['floor'] = floor;
    map['row_no'] = rowNo;
    map['column_no'] = columnNo;
    map['shelf_id'] = shelfId;
    map['book_cover'] = bookCover;
    map['limit_qty'] = limitQty;
    map['status'] = status;
    map['reading_duration'] = readingDuration;
    map['bookname'] = bookname;
    map['author_name'] = authorName;
    map['description'] = description;
    map['isbn_code'] = isbnCode;
    map['qty'] = qty;
    map['book_type_id'] = bookTypeId;
    map['numberofpages'] = numberofpages;
    map['edition'] = edition;
    map['issue_date'] = issueDate;
    if (bookfile != null) {
      map['bookfile'] = bookfile?.map((v) => v.toJson()).toList();
    }
    map['bookfile_url'] = bookfileUrl;
    return map;
  }
}

class Bookfile {
  Bookfile({
    this.id,
  });

  Bookfile.fromJson(dynamic json) {
    id = json['id'];
  }

  num? id;

  Bookfile copyWith({
    num? id,
  }) =>
      Bookfile(
        id: id ?? this.id,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    return map;
  }
}
