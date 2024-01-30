part of 'featured_books_cubit.dart';

abstract class FeaturedBooksState {}

class FeaturedBooksInitial extends FeaturedBooksState {}

class FeaturedBooksLoading extends FeaturedBooksState {}

class FeaturedBooksSuccess extends FeaturedBooksState {
  List<BookEntity> books;
  FeaturedBooksSuccess(this.books);
}

class FeaturedBooksFailure extends FeaturedBooksState {
  Failure failure;
  FeaturedBooksFailure(this.failure);
}
