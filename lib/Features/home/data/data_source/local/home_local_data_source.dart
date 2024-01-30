import 'package:bookly/Features/home/domain/entity/book_entity.dart';

abstract class HomeLocalDataSource {
  List<BookEntity> fetchNewestBooks();
  List<BookEntity> fetchFeturedBooks();
}

class HomeLocalDataSoureImp extends HomeLocalDataSource {
  @override
  List<BookEntity> fetchFeturedBooks() {
    // TODO: implement fetchFeturedBooks
    throw UnimplementedError();
  }

  @override
  List<BookEntity> fetchNewestBooks() {
    // TODO: implement fetchNewestBooks
    throw UnimplementedError();
  }

}
