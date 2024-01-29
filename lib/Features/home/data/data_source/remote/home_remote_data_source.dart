import 'package:bookly/Features/home/data/model/books/books.dart';
import 'package:bookly/Features/home/domain/entity/book_entity.dart';
import 'package:bookly/core/utils/api_services/api_services.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchNewest();

  Future<List<BookEntity>> fetchFeatured();
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiServices apiServices = ApiServices();
  @override
  Future<List<BookEntity>> fetchFeatured() async{
    var res =await apiServices.get(endpoint: 'volumes?q=spatium');
    return BookResponse.fromMap(res).items!;
  }

  @override
  Future<List<BookEntity>> fetchNewest()async {
   var res =await apiServices.get(endpoint: 'volumes?q=spatium');
    return BookResponse.fromMap(res).items!;

  }
}
