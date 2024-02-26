/// data : [{"return_date":"2023-02-01T00:00:00.000000Z","book_info":{"id":1,"location_id":1,"floor":"1","row_no":"2","column_no":"3","shelf_id":1,"book_cover":"http://192.168.236.149:8000/bookcovers/63eba089634b49CC23C74-2D98-4F82-883B-EF969F6DF9E5.jpeg","limit_qty":1,"status":"1","reading_duration":5,"bookname":"Laravel","author_name":"eimg","description":null,"isbn_code":"123456","qty":-2,"book_type_id":1,"numberofpages":"900","edition":"4","issue_date":"2023-02-14","check_limit_qty":0,"bookfile":[{"original_url":"http://localhost:8000/storage/4/63eba05531f36_Laravel-book-by-Ei-Maung.pdf"}]}}]

class BorrowBookResponse {
  BorrowBookResponse({
    this.data,
  });

  BorrowBookResponse.fromJson(dynamic json) {
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
  }
  List<Data>? data;
  BorrowBookResponse copyWith({
    List<Data>? data,
  }) =>
      BorrowBookResponse(
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

/// return_date : "2023-02-01T00:00:00.000000Z"
/// book_info : {"id":1,"location_id":1,"floor":"1","row_no":"2","column_no":"3","shelf_id":1,"book_cover":"http://192.168.236.149:8000/bookcovers/63eba089634b49CC23C74-2D98-4F82-883B-EF969F6DF9E5.jpeg","limit_qty":1,"status":"1","reading_duration":5,"bookname":"Laravel","author_name":"eimg","description":null,"isbn_code":"123456","qty":-2,"book_type_id":1,"numberofpages":"900","edition":"4","issue_date":"2023-02-14","check_limit_qty":0,"bookfile":[{"original_url":"http://localhost:8000/storage/4/63eba05531f36_Laravel-book-by-Ei-Maung.pdf"}]}

class Data {
  Data({
    this.returnDate,
    this.bookInfo,
  });

  Data.fromJson(dynamic json) {
    returnDate = json['return_date'];
    bookInfo =
        json['book_info'] != null ? BookInfo.fromJson(json['book_info']) : null;
  }
  String? returnDate;
  BookInfo? bookInfo;
  Data copyWith({
    String? returnDate,
    BookInfo? bookInfo,
  }) =>
      Data(
        returnDate: returnDate ?? this.returnDate,
        bookInfo: bookInfo ?? this.bookInfo,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['return_date'] = returnDate;
    if (bookInfo != null) {
      map['book_info'] = bookInfo?.toJson();
    }
    return map;
  }
}

/// id : 1
/// location_id : 1
/// floor : "1"
/// row_no : "2"
/// column_no : "3"
/// shelf_id : 1
/// book_cover : "http://192.168.236.149:8000/bookcovers/63eba089634b49CC23C74-2D98-4F82-883B-EF969F6DF9E5.jpeg"
/// limit_qty : 1
/// status : "1"
/// reading_duration : 5
/// bookname : "Laravel"
/// author_name : "eimg"
/// description : null
/// isbn_code : "123456"
/// qty : -2
/// book_type_id : 1
/// numberofpages : "900"
/// edition : "4"
/// issue_date : "2023-02-14"
/// check_limit_qty : 0
/// bookfile : [{"original_url":"http://localhost:8000/storage/4/63eba05531f36_Laravel-book-by-Ei-Maung.pdf"}]

class BookInfo {
  BookInfo({
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
    this.checkLimitQty,
    this.bookfile,
  });

  BookInfo.fromJson(dynamic json) {
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
    checkLimitQty = json['check_limit_qty'];
    if (json['bookfile'] != null) {
      bookfile = [];
      json['bookfile'].forEach((v) {
        bookfile?.add(Bookfile.fromJson(v));
      });
    }
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
  dynamic description;
  String? isbnCode;
  num? qty;
  num? bookTypeId;
  String? numberofpages;
  String? edition;
  String? issueDate;
  num? checkLimitQty;
  List<Bookfile>? bookfile;
  BookInfo copyWith({
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
    dynamic description,
    String? isbnCode,
    num? qty,
    num? bookTypeId,
    String? numberofpages,
    String? edition,
    String? issueDate,
    num? checkLimitQty,
    List<Bookfile>? bookfile,
  }) =>
      BookInfo(
        id: id ?? this.id,
        locationId: locationId ?? this.locationId,
        floor: floor ?? this.floor,
        rowNo: rowNo ?? this.rowNo,
        columnNo: columnNo ?? this.columnNo,
        shelfId: shelfId ?? this.shelfId,
        bookCover: bookCover ?? this.bookCover,
        limitQty: limitQty ?? this.limitQty,
        status: status ?? this.status,
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
        checkLimitQty: checkLimitQty ?? this.checkLimitQty,
        bookfile: bookfile ?? this.bookfile,
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
    map['check_limit_qty'] = checkLimitQty;
    if (bookfile != null) {
      map['bookfile'] = bookfile?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// original_url : "http://localhost:8000/storage/4/63eba05531f36_Laravel-book-by-Ei-Maung.pdf"

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
