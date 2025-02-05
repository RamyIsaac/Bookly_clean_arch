import 'package:hive_flutter/adapters.dart';
import 'package:hive/hive.dart';
part 'book_entity.g.dart';

@HiveType(typeId: 0)
class BookEntity {
  @HiveField(0)
  final String bookId;
  @HiveField(1)
  final String? imageUrl;
  @HiveField(2)
  final String bookTitle;
  @HiveField(3)
  final String? authorName;
  @HiveField(4)
  final num? rating;
  @HiveField(5)
  final num? count;

  BookEntity(
      {required this.bookId,
      required this.imageUrl,
      required this.bookTitle,
      required this.authorName,
      required this.rating,
      required this.count});
}
