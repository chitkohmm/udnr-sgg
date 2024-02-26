/// message : "success"
/// data : [{"expired_day":"6","expired_date":"2023-02-10T00:00:00.000000Z","bookinfo":{"id":1,"location_id":1,"floor":"1","row_no":"2","column_no":"3","shelf_id":1,"book_cover":"http://192.168.236.149:8000/bookcovers/63eba089634b49CC23C74-2D98-4F82-883B-EF969F6DF9E5.jpeg","limit_qty":1,"status":"1","reading_duration":5,"bookname":"Laravel","author_name":"eimg","description":null,"isbn_code":"123456","qty":8,"book_type_id":1,"numberofpages":"900","edition":"4","issue_date":"2023-02-14","check_limit_qty":0,"bookfile":[{"id":4,"model_type":"App\\Models\\Book","model_id":1,"uuid":"f94dcc58-c795-4aad-9159-b79a90172c2c","collection_name":"bookfile","name":"63eba05531f36_Laravel-book-by-Ei-Maung","file_name":"63eba05531f36_Laravel-book-by-Ei-Maung.pdf","mime_type":"application/pdf","disk":"public","conversions_disk":"public","size":3245668,"manipulations":[],"custom_properties":[],"generated_conversions":[],"responsive_images":[],"order_column":4,"created_at":"2023-02-14T21:24:01.000000Z","updated_at":"2023-02-14T21:24:01.000000Z","original_url":"http://localhost:8000/storage/4/63eba05531f36_Laravel-book-by-Ei-Maung.pdf","preview_url":""}],"media":[{"id":4,"model_type":"App\\Models\\Book","model_id":1,"uuid":"f94dcc58-c795-4aad-9159-b79a90172c2c","collection_name":"bookfile","name":"63eba05531f36_Laravel-book-by-Ei-Maung","file_name":"63eba05531f36_Laravel-book-by-Ei-Maung.pdf","mime_type":"application/pdf","disk":"public","conversions_disk":"public","size":3245668,"manipulations":[],"custom_properties":[],"generated_conversions":[],"responsive_images":[],"order_column":4,"created_at":"2023-02-14T21:24:01.000000Z","updated_at":"2023-02-14T21:24:01.000000Z","original_url":"http://localhost:8000/storage/4/63eba05531f36_Laravel-book-by-Ei-Maung.pdf","preview_url":""}]}}]

class ExpiredBooks {
  ExpiredBooks({
    this.message,
    this.data,
  });

  ExpiredBooks.fromJson(dynamic json) {
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
  ExpiredBooks copyWith({
    String? message,
    List<Data>? data,
  }) =>
      ExpiredBooks(
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

/// expired_day : "6"
/// expired_date : "2023-02-10T00:00:00.000000Z"
/// bookinfo : {"id":1,"location_id":1,"floor":"1","row_no":"2","column_no":"3","shelf_id":1,"book_cover":"http://192.168.236.149:8000/bookcovers/63eba089634b49CC23C74-2D98-4F82-883B-EF969F6DF9E5.jpeg","limit_qty":1,"status":"1","reading_duration":5,"bookname":"Laravel","author_name":"eimg","description":null,"isbn_code":"123456","qty":8,"book_type_id":1,"numberofpages":"900","edition":"4","issue_date":"2023-02-14","check_limit_qty":0,"bookfile":[{"id":4,"model_type":"App\\Models\\Book","model_id":1,"uuid":"f94dcc58-c795-4aad-9159-b79a90172c2c","collection_name":"bookfile","name":"63eba05531f36_Laravel-book-by-Ei-Maung","file_name":"63eba05531f36_Laravel-book-by-Ei-Maung.pdf","mime_type":"application/pdf","disk":"public","conversions_disk":"public","size":3245668,"manipulations":[],"custom_properties":[],"generated_conversions":[],"responsive_images":[],"order_column":4,"created_at":"2023-02-14T21:24:01.000000Z","updated_at":"2023-02-14T21:24:01.000000Z","original_url":"http://localhost:8000/storage/4/63eba05531f36_Laravel-book-by-Ei-Maung.pdf","preview_url":""}],"media":[{"id":4,"model_type":"App\\Models\\Book","model_id":1,"uuid":"f94dcc58-c795-4aad-9159-b79a90172c2c","collection_name":"bookfile","name":"63eba05531f36_Laravel-book-by-Ei-Maung","file_name":"63eba05531f36_Laravel-book-by-Ei-Maung.pdf","mime_type":"application/pdf","disk":"public","conversions_disk":"public","size":3245668,"manipulations":[],"custom_properties":[],"generated_conversions":[],"responsive_images":[],"order_column":4,"created_at":"2023-02-14T21:24:01.000000Z","updated_at":"2023-02-14T21:24:01.000000Z","original_url":"http://localhost:8000/storage/4/63eba05531f36_Laravel-book-by-Ei-Maung.pdf","preview_url":""}]}

class Data {
  Data({
    this.expiredDay,
    this.expiredDate,
    this.bookinfo,
  });

  Data.fromJson(dynamic json) {
    expiredDay = json['expired_day'];
    expiredDate = json['expired_date'];
    bookinfo =
        json['bookinfo'] != null ? Bookinfo.fromJson(json['bookinfo']) : null;
  }
  String? expiredDay;
  String? expiredDate;
  Bookinfo? bookinfo;
  Data copyWith({
    String? expiredDay,
    String? expiredDate,
    Bookinfo? bookinfo,
  }) =>
      Data(
        expiredDay: expiredDay ?? this.expiredDay,
        expiredDate: expiredDate ?? this.expiredDate,
        bookinfo: bookinfo ?? this.bookinfo,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['expired_day'] = expiredDay;
    map['expired_date'] = expiredDate;
    if (bookinfo != null) {
      map['bookinfo'] = bookinfo?.toJson();
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
/// qty : 8
/// book_type_id : 1
/// numberofpages : "900"
/// edition : "4"
/// issue_date : "2023-02-14"
/// check_limit_qty : 0
/// bookfile : [{"id":4,"model_type":"App\\Models\\Book","model_id":1,"uuid":"f94dcc58-c795-4aad-9159-b79a90172c2c","collection_name":"bookfile","name":"63eba05531f36_Laravel-book-by-Ei-Maung","file_name":"63eba05531f36_Laravel-book-by-Ei-Maung.pdf","mime_type":"application/pdf","disk":"public","conversions_disk":"public","size":3245668,"manipulations":[],"custom_properties":[],"generated_conversions":[],"responsive_images":[],"order_column":4,"created_at":"2023-02-14T21:24:01.000000Z","updated_at":"2023-02-14T21:24:01.000000Z","original_url":"http://localhost:8000/storage/4/63eba05531f36_Laravel-book-by-Ei-Maung.pdf","preview_url":""}]
/// media : [{"id":4,"model_type":"App\\Models\\Book","model_id":1,"uuid":"f94dcc58-c795-4aad-9159-b79a90172c2c","collection_name":"bookfile","name":"63eba05531f36_Laravel-book-by-Ei-Maung","file_name":"63eba05531f36_Laravel-book-by-Ei-Maung.pdf","mime_type":"application/pdf","disk":"public","conversions_disk":"public","size":3245668,"manipulations":[],"custom_properties":[],"generated_conversions":[],"responsive_images":[],"order_column":4,"created_at":"2023-02-14T21:24:01.000000Z","updated_at":"2023-02-14T21:24:01.000000Z","original_url":"http://localhost:8000/storage/4/63eba05531f36_Laravel-book-by-Ei-Maung.pdf","preview_url":""}]

class Bookinfo {
  Bookinfo({
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
  });

  Bookinfo.fromJson(dynamic json) {
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

  Bookinfo copyWith({
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
  }) =>
      Bookinfo(
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
          checkLimitQty: checkLimitQty ?? this.checkLimitQty);
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

    return map;
  }
}

/// id : 4
/// model_type : "App\\Models\\Book"
/// model_id : 1
/// uuid : "f94dcc58-c795-4aad-9159-b79a90172c2c"
/// collection_name : "bookfile"
/// name : "63eba05531f36_Laravel-book-by-Ei-Maung"
/// file_name : "63eba05531f36_Laravel-book-by-Ei-Maung.pdf"
/// mime_type : "application/pdf"
/// disk : "public"
/// conversions_disk : "public"
/// size : 3245668
/// manipulations : []
/// custom_properties : []
/// generated_conversions : []
/// responsive_images : []
/// order_column : 4
/// created_at : "2023-02-14T21:24:01.000000Z"
/// updated_at : "2023-02-14T21:24:01.000000Z"
/// original_url : "http://localhost:8000/storage/4/63eba05531f36_Laravel-book-by-Ei-Maung.pdf"
/// preview_url : ""

/// id : 4
/// model_type : "App\\Models\\Book"
/// model_id : 1
/// uuid : "f94dcc58-c795-4aad-9159-b79a90172c2c"
/// collection_name : "bookfile"
/// name : "63eba05531f36_Laravel-book-by-Ei-Maung"
/// file_name : "63eba05531f36_Laravel-book-by-Ei-Maung.pdf"
/// mime_type : "application/pdf"
/// disk : "public"
/// conversions_disk : "public"
/// size : 3245668
/// manipulations : []
/// custom_properties : []
/// generated_conversions : []
/// responsive_images : []
/// order_column : 4
/// created_at : "2023-02-14T21:24:01.000000Z"
/// updated_at : "2023-02-14T21:24:01.000000Z"
/// original_url : "http://localhost:8000/storage/4/63eba05531f36_Laravel-book-by-Ei-Maung.pdf"
/// preview_url : ""
