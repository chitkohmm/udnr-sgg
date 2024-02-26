/// category_id : 5

class BooksByCategoryRequestBody {
  BooksByCategoryRequestBody({
    this.categoryId,
  });

  BooksByCategoryRequestBody.fromJson(dynamic json) {
    categoryId = json['category_id'];
  }
  num? categoryId;
  BooksByCategoryRequestBody copyWith({
    num? categoryId,
  }) =>
      BooksByCategoryRequestBody(
        categoryId: categoryId ?? this.categoryId,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['category_id'] = categoryId;
    return map;
  }
}
