/// user_id : 2

class BookRequestBody {
  BookRequestBody({
    this.userId,
  });

  BookRequestBody.fromJson(dynamic json) {
    userId = json['user_id'];
  }
  num? userId;
  BookRequestBody copyWith({
    num? userId,
  }) =>
      BookRequestBody(
        userId: userId ?? this.userId,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['user_id'] = userId;
    return map;
  }
}
