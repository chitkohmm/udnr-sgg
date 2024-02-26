/// searchItem : "A"

class Search {
  Search({
    this.searchItem,
  });

  Search.fromJson(dynamic json) {
    searchItem = json['searchItem'];
  }
  String? searchItem;
  Search copyWith({
    String? searchItem,
  }) =>
      Search(
        searchItem: searchItem ?? this.searchItem,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['searchItem'] = searchItem;
    return map;
  }
}
