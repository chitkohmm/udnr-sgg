/// message : "You already borrowed this book"
/// status : 403

class OrderResponse {
  OrderResponse({
    this.message,
    this.status,
  });

  OrderResponse.fromJson(dynamic json) {
    message = json['message'];
    status = json['status'];
  }
  String? message;
  num? status;
  OrderResponse copyWith({
    String? message,
    num? status,
  }) =>
      OrderResponse(
        message: message ?? this.message,
        status: status ?? this.status,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['status'] = status;
    return map;
  }
}
