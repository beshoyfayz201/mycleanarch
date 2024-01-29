import 'package:dartz/dartz.dart';

import 'package:bookly/Features/home/domain/entity/book_entity.dart';
import 'package:bookly/Features/home/domain/repos/home_repo.dart';
import 'package:bookly/core/errors/failure.dart';

class FetchFeaturedBooksUseCase extends UseCase<List<BookEntity>, void> {
  final HomeRepo homeRepo;
  FetchFeaturedBooksUseCase({
    required this.homeRepo,
  });

  @override
  Future<Either<Failure, List<BookEntity>>> call([void params]) async {
    return await homeRepo.fetchFeaturedBooks();
  }
}

abstract class UseCase<T, Params> {
  Future<Either<Failure, T>> call([Params? params]);
}
