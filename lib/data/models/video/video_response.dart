/// message : "success!"
/// data : [{"category_name":"Category Test","videos":[{"id":2,"name":"test","category_id":1,"file_upload":"1684481341New Tab.mp4"},{"id":3,"name":"testttttt","category_id":1,"file_upload":"1684481366New Tab.mp4"}]}]

class VideoResponse {
  VideoResponse({
    this.message,
    this.data,
  });

  VideoResponse.fromJson(dynamic json) {
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
  VideoResponse copyWith({
    String? message,
    List<Data>? data,
  }) =>
      VideoResponse(
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

/// category_name : "Category Test"
/// videos : [{"id":2,"name":"test","category_id":1,"file_upload":"1684481341New Tab.mp4"},{"id":3,"name":"testttttt","category_id":1,"file_upload":"1684481366New Tab.mp4"}]

class Data {
  Data({
    this.categoryName,
    this.videos,
  });

  Data.fromJson(dynamic json) {
    categoryName = json['category_name'];
    if (json['videos'] != null) {
      videos = [];
      json['videos'].forEach((v) {
        videos?.add(Videos.fromJson(v));
      });
    }
  }
  String? categoryName;
  List<Videos>? videos;
  Data copyWith({
    String? categoryName,
    List<Videos>? videos,
  }) =>
      Data(
        categoryName: categoryName ?? this.categoryName,
        videos: videos ?? this.videos,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['category_name'] = categoryName;
    if (videos != null) {
      map['videos'] = videos?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// id : 2
/// name : "test"
/// category_id : 1
/// file_upload : "1684481341New Tab.mp4"

class Videos {
  Videos(
      {this.id,
      this.name,
      this.categoryId,
      this.fileUpload,
      this.thumbnail,
      this.videoCover});

  Videos.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    categoryId = json['category_id'];
    fileUpload = json['file_upload'];
    videoCover = json['video_cover'];
  }
  num? id;
  String? name;
  num? categoryId;
  String? fileUpload;
  String? thumbnail;
  String? videoCover;
  Videos copyWith({
    num? id,
    String? name,
    num? categoryId,
    String? fileUpload,
    String? videoCover,
  }) =>
      Videos(
        id: id ?? this.id,
        name: name ?? this.name,
        categoryId: categoryId ?? this.categoryId,
        fileUpload: fileUpload ?? this.fileUpload,
        videoCover: videoCover ?? this.videoCover,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['category_id'] = categoryId;
    map['file_upload'] = fileUpload;
    map['video_cover'] = videoCover;
    return map;
  }
}
