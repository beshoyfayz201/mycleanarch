import 'package:hive/hive.dart';

import 'package:bookly/Features/home/data/model/books/books.dart';
import 'package:bookly/Features/home/domain/entity/book_entity.dart';
import 'package:bookly/core/utils/api_services/api_services.dart';
import 'package:bookly/core/utils/appconsts.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchNewest();

  Future<List<BookEntity>> fetchFeatured();
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiServices apiServices;
  HomeRemoteDataSourceImpl({
    required this.apiServices,
  });
  @override
  Future<List<BookEntity>> fetchFeatured() async {
    var res = await apiServices.get(endpoint: 'volumes?q=programming');

    List<BookEntity> books = BookResponse.fromMap(res).items!;
    Hive.box<BookEntity>(AppConsts.faturedHiveBox).addAll(books);
    return books;
  }

  @override
  Future<List<BookEntity>> fetchNewest() async {
    var res =
        await apiServices.get(endpoint: 'volumes?q=software&sorting=newest');
    List<BookEntity> books = BookResponse.fromMap(res).items!;

    Hive.box<BookEntity>(AppConsts.newestHiveBox).addAll(books);
    return BookResponse.fromMap(res).items!;
  }
}
