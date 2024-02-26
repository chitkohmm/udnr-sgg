/// meta : {"current_page":1,"from":1,"last_page":11,"links":[{"url":null,"label":"&laquo; Previous","active":false},{"url":"https://lib-ms.hmmdemo.net/api/v1/books?page=1","label":"1","active":true},{"url":"https://lib-ms.hmmdemo.net/api/v1/books?page=2","label":"2","active":false},{"url":"https://lib-ms.hmmdemo.net/api/v1/books?page=3","label":"3","active":false},{"url":"https://lib-ms.hmmdemo.net/api/v1/books?page=4","label":"4","active":false},{"url":"https://lib-ms.hmmdemo.net/api/v1/books?page=5","label":"5","active":false},{"url":"https://lib-ms.hmmdemo.net/api/v1/books?page=6","label":"6","active":false},{"url":"https://lib-ms.hmmdemo.net/api/v1/books?page=7","label":"7","active":false},{"url":"https://lib-ms.hmmdemo.net/api/v1/books?page=8","label":"8","active":false},{"url":"https://lib-ms.hmmdemo.net/api/v1/books?page=9","label":"9","active":false},{"url":"https://lib-ms.hmmdemo.net/api/v1/books?page=10","label":"10","active":false},{"url":"https://lib-ms.hmmdemo.net/api/v1/books?page=11","label":"11","active":false},{"url":"https://lib-ms.hmmdemo.net/api/v1/books?page=2","label":"Next &raquo;","active":false}],"path":"https://lib-ms.hmmdemo.net/api/v1/books","per_page":20,"to":20,"total":219}

// class Meta {
//   Meta({
//       this.meta,});
//
//   Meta.fromJson(dynamic json) {
//     meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
//   }
//   Meta? meta;
// Meta copyWith({  Meta? meta,
// }) => Meta(  meta: meta ?? this.meta,
// );
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     if (meta != null) {
//       map['meta'] = meta?.toJson();
//     }
//     return map;
//   }
//
// }

/// current_page : 1
/// from : 1
/// last_page : 11
/// links : [{"url":null,"label":"&laquo; Previous","active":false},{"url":"https://lib-ms.hmmdemo.net/api/v1/books?page=1","label":"1","active":true},{"url":"https://lib-ms.hmmdemo.net/api/v1/books?page=2","label":"2","active":false},{"url":"https://lib-ms.hmmdemo.net/api/v1/books?page=3","label":"3","active":false},{"url":"https://lib-ms.hmmdemo.net/api/v1/books?page=4","label":"4","active":false},{"url":"https://lib-ms.hmmdemo.net/api/v1/books?page=5","label":"5","active":false},{"url":"https://lib-ms.hmmdemo.net/api/v1/books?page=6","label":"6","active":false},{"url":"https://lib-ms.hmmdemo.net/api/v1/books?page=7","label":"7","active":false},{"url":"https://lib-ms.hmmdemo.net/api/v1/books?page=8","label":"8","active":false},{"url":"https://lib-ms.hmmdemo.net/api/v1/books?page=9","label":"9","active":false},{"url":"https://lib-ms.hmmdemo.net/api/v1/books?page=10","label":"10","active":false},{"url":"https://lib-ms.hmmdemo.net/api/v1/books?page=11","label":"11","active":false},{"url":"https://lib-ms.hmmdemo.net/api/v1/books?page=2","label":"Next &raquo;","active":false}]
/// path : "https://lib-ms.hmmdemo.net/api/v1/books"
/// per_page : 20
/// to : 20
/// total : 219

class Meta {
  Meta({
    this.currentPage,
    this.from,
    this.lastPage,
    this.links,
    this.path,
    this.perPage,
    this.to,
    this.total,
  });

  Meta.fromJson(dynamic json) {
    currentPage = json['current_page'];
    from = json['from'];
    lastPage = json['last_page'];
    if (json['links'] != null) {
      links = [];
      json['links'].forEach((v) {
        links?.add(Links.fromJson(v));
      });
    }
    path = json['path'];
    perPage = json['per_page'];
    to = json['to'];
    total = json['total'];
  }
  num? currentPage;
  num? from;
  num? lastPage;
  List<Links>? links;
  String? path;
  num? perPage;
  num? to;
  num? total;
  Meta copyWith({
    num? currentPage,
    num? from,
    num? lastPage,
    List<Links>? links,
    String? path,
    num? perPage,
    num? to,
    num? total,
  }) =>
      Meta(
        currentPage: currentPage ?? this.currentPage,
        from: from ?? this.from,
        lastPage: lastPage ?? this.lastPage,
        links: links ?? this.links,
        path: path ?? this.path,
        perPage: perPage ?? this.perPage,
        to: to ?? this.to,
        total: total ?? this.total,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['current_page'] = currentPage;
    map['from'] = from;
    map['last_page'] = lastPage;
    if (links != null) {
      map['links'] = links?.map((v) => v.toJson()).toList();
    }
    map['path'] = path;
    map['per_page'] = perPage;
    map['to'] = to;
    map['total'] = total;
    return map;
  }
}

/// url : null
/// label : "&laquo; Previous"
/// active : false

class Links {
  Links({
    this.url,
    this.label,
    this.active,
  });

  Links.fromJson(dynamic json) {
    url = json['url'];
    label = json['label'];
    active = json['active'];
  }
  dynamic url;
  String? label;
  bool? active;
  Links copyWith({
    dynamic url,
    String? label,
    bool? active,
  }) =>
      Links(
        url: url ?? this.url,
        label: label ?? this.label,
        active: active ?? this.active,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['url'] = url;
    map['label'] = label;
    map['active'] = active;
    return map;
  }
}
