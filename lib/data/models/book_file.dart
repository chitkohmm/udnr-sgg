/// file_path : ""
/// cover : ""
/// book_name : ""
/// author : ""

class BookFile {
  BookFile({
    this.filePath,
    this.cover,
    this.bookName,
    this.bookId,
    this.author,
  });

  BookFile.fromJson(dynamic json) {
    filePath = json['file_path'];
    cover = json['cover'];
    bookName = json['name'];
    author = json['author'];
    bookId = json['book_id'];
  }
  String? filePath;
  String? cover;
  String? bookName;
  String? author;
  int? bookId;
  BookFile copyWith(
          {String? filePath,
          String? cover,
          String? bookName,
          String? author,
          int? bookId}) =>
      BookFile(
          filePath: filePath ?? this.filePath,
          cover: cover ?? this.cover,
          bookName: bookName ?? this.bookName,
          author: author ?? this.author,
          bookId: bookId ?? this.bookId);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['file_path'] = filePath;
    map['cover'] = cover;
    map['name'] = bookName;
    map['author'] = author;
    map['book_id'] = bookId;
    return map;
  }
}
