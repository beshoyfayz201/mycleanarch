import 'package:bookly/Features/home/domain/entity/book_entity.dart';
import 'package:bookly/core/utils/appconsts.dart';
import 'package:hive/hive.dart';

abstract class HomeLocalDataSource {
  List<BookEntity> fetchNewestBooks();
  List<BookEntity> fetchFeturedBooks();
}

class HomeLocalDataSourceImp extends HomeLocalDataSource {
  @override
  List<BookEntity> fetchFeturedBooks() {
    List<BookEntity> books =
        Hive.box<BookEntity>(AppConsts.faturedHiveBox).values.toList();
    return books;
  }

  @override
  List<BookEntity> fetchNewestBooks() {
    List<BookEntity> books =
        Hive.box<BookEntity>(AppConsts.newestHiveBox).values.toList();
    return books;
  }
}
