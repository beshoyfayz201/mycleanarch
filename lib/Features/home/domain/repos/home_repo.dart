import 'package:bookly/Features/home/domain/entity/book_entity.dart';
import 'package:bookly/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failure,BookEntity>> fetchFeaturedBooks();
  Future<Either<Failure,BookEntity>> fetchNewestBooks();
}
