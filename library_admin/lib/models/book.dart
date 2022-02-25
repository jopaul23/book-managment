class BookModel {
  BookModel({
    required this.bookId,
    required this.bookName,
    required this.authorName,
    required this.publisherName,
    required this.bookCount,
  });

  int bookId;
  String bookName;
  String authorName;
  String publisherName;
  int bookCount;

  factory BookModel.fromMap(Map<String, dynamic> json) => BookModel(
        bookId: json["book_id"],
        bookName: json["book_name"],
        authorName: json["author_name"],
        publisherName: json["publisher_name"],
        bookCount: json["book_count"],
      );

  Map<String, dynamic> toMap() => {
        "book_id": bookId,
        "book_name": bookName,
        "author_name": authorName,
        "publisher_name": publisherName,
        "book_count": bookCount,
      };
}
