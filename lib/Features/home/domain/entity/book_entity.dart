import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
part 'book_entity.g.dart';

@HiveType(typeId: 0)
class BookEntity {
@HiveField(0)
  final num price;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String image;
  @HiveField(3)
  final String authorName;
  @HiveField(4)
  final num rating;

  const BookEntity({
    required this.price,
    required this.title,
    required this.authorName,
    required this.image,
    required this.rating,
  });
}
