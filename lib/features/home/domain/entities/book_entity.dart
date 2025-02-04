class BookEntity {
  final String bookId;
  final String? imageUrl;
  final String bookTitle;
  final String? authorName;
  final num price;
  final num? rating;
  final num? count;

  BookEntity(
      {required this.bookId,
      required this.imageUrl,
      required this.bookTitle,
      required this.authorName,
      required this.price,
      required this.rating,
      required this.count});
}
