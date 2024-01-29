import 'package:dartz/dartz.dart';

import 'package:bookly/Features/home/domain/entity/book_entity.dart';
import 'package:bookly/Features/home/domain/repos/home_repo.dart';
import 'package:bookly/core/errors/failure.dart';

class FetchFeaturedBooksUseCase {
  final HomeRepo homeRepo;
  FetchFeaturedBooksUseCase({
    required this.homeRepo,
  });
  
  Future<Either<Failure, BookEntity>> fetchFeaturedBooks() {
    return homeRepo.fetchFeaturedBooks();
  }
  Future<Either<Failure, BookEntity>> fetchNewestBooks() {
    return homeRepo.fetchNewestBooks();
  }
}
