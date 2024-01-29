class BookEntity {
  final num price;
  final String title;
  final String image;
  final String authorName;
  final num rating;

  const BookEntity({
    required this.price,
    required this.title,
    required this.authorName,
    required this.image,
    required this.rating,
  });
}
