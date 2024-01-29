import 'package:dartz/dartz.dart';

import 'package:bookly/Features/home/domain/entity/book_entity.dart';
import 'package:bookly/Features/home/domain/repos/home_repo.dart';
import 'package:bookly/Features/home/domain/usecases/fetch_featured_books_use_case.dart';
import 'package:bookly/core/errors/failure.dart';

class FetchNewestUseCase extends UseCase<List<BookEntity>, void> {
  final HomeRepo homeRepo;
  FetchNewestUseCase({
    required this.homeRepo,
  });

  @override
  Future<Either<Failure, List<BookEntity>>> call([void params]) {
    return homeRepo.fetchNewestBooks();
  }
}
