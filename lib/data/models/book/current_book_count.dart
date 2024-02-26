/// message : "success"
/// count : 3

class CurrentBookCount {
  CurrentBookCount({
    this.message,
    this.count,
  });

  CurrentBookCount.fromJson(dynamic json) {
    message = json['message'];
    count = json['count'];
  }
  String? message;
  num? count;
  CurrentBookCount copyWith({
    String? message,
    num? count,
  }) =>
      CurrentBookCount(
        message: message ?? this.message,
        count: count ?? this.count,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['count'] = count;
    return map;
  }
}
