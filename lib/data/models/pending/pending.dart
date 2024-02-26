/// message : "Success"
/// data : [{"id":4,"location_id":2,"floor":"4","row_no":"3","column_no":"4","shelf_id":3,"book_cover":"https://lib-ms.hmmdemo.net/bookcovers/63eba162746ff8AEA959B-E7B7-4988-B08E-90C85CA4D003.jpeg","limit_qty":10,"status":"1","reading_duration":6,"bookname":"PHP in OOP","author_name":"hmm","description":null,"isbn_code":"8753214","qty":7,"book_type_id":1,"numberofpages":"990","edition":"6","issue_date":"2023-02-14"}]

class Pending {
  Pending({
    this.message,
    this.data,
  });

  Pending.fromJson(dynamic json) {
    message = json['message'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
  }
  String? message;
  List<Data>? data;
  Pending copyWith({
    String? message,
    List<Data>? data,
  }) =>
      Pending(
        message: message ?? this.message,
        data: data ?? this.data,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// id : 4
/// location_id : 2
/// floor : "4"
/// row_no : "3"
/// column_no : "4"
/// shelf_id : 3
/// book_cover : "https://lib-ms.hmmdemo.net/bookcovers/63eba162746ff8AEA959B-E7B7-4988-B08E-90C85CA4D003.jpeg"
/// limit_qty : 10
/// status : "1"
/// reading_duration : 6
/// bookname : "PHP in OOP"
/// author_name : "hmm"
/// description : null
/// isbn_code : "8753214"
/// qty : 7
/// book_type_id : 1
/// numberofpages : "990"
/// edition : "6"
/// issue_date : "2023-02-14"

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
    dynamic description,
    String? isbnCode,
    num? qty,
    num? bookTypeId,
    String? numberofpages,
    String? edition,
    String? issueDate,
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
    return map;
  }
}
