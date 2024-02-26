/// message : "success!"
/// data : [{"id":1,"issued_returns_id":1,"user_id":null,"title":"Hello Librarian","description":"New order has received!","created_at":"2023-05-27T08:32:59.000000Z","updated_at":"2023-05-27T08:32:59.000000Z"}]

class NotificationObject {
  NotificationObject({
    this.message,
    this.data,
  });

  NotificationObject.fromJson(dynamic json) {
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
  NotificationObject copyWith({
    String? message,
    List<Data>? data,
  }) =>
      NotificationObject(
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

/// id : 1
/// issued_returns_id : 1
/// user_id : null
/// title : "Hello Librarian"
/// description : "New order has received!"
/// created_at : "2023-05-27T08:32:59.000000Z"
/// updated_at : "2023-05-27T08:32:59.000000Z"

class Data {
  Data({
    this.id,
    this.issuedReturnsId,
    this.userId,
    this.title,
    this.description,
    this.createdAt,
    this.updatedAt,
  });

  Data.fromJson(dynamic json) {
    id = json['id'];
    issuedReturnsId = json['issued_returns_id'];
    userId = json['user_id'];
    title = json['title'];
    description = json['description'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  num? id;
  num? issuedReturnsId;
  dynamic userId;
  String? title;
  String? description;
  String? createdAt;
  String? updatedAt;
  Data copyWith({
    num? id,
    num? issuedReturnsId,
    dynamic userId,
    String? title,
    String? description,
    String? createdAt,
    String? updatedAt,
  }) =>
      Data(
        id: id ?? this.id,
        issuedReturnsId: issuedReturnsId ?? this.issuedReturnsId,
        userId: userId ?? this.userId,
        title: title ?? this.title,
        description: description ?? this.description,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['issued_returns_id'] = issuedReturnsId;
    map['user_id'] = userId;
    map['title'] = title;
    map['description'] = description;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }
}
