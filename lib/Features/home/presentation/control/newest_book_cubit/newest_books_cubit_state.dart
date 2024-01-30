
import 'package:bookly/Features/home/domain/entity/book_entity.dart';
import 'package:bookly/core/errors/failure.dart';

abstract class NewestBooksState {}

class NewestBooksInitial extends NewestBooksState {}

class NewestBooksLoading extends NewestBooksState {}

class NewestBooksSuccess extends NewestBooksState {
  List<BookEntity> books;
  NewestBooksSuccess(this.books);
}

class NewestBooksFailure extends NewestBooksState {
  Failure failure;
  NewestBooksFailure(this.failure);
}
