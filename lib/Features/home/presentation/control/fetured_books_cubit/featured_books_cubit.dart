import 'package:bloc/bloc.dart';
import 'package:bookly/Features/home/domain/entity/book_entity.dart';
import 'package:bookly/Features/home/domain/usecases/fetch_featured_books_use_case.dart';
import 'package:bookly/core/errors/failure.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FetchFeaturedBooksUseCase featuredBooksUseCase;
  FeaturedBooksCubit(this.featuredBooksUseCase) : super(FeaturedBooksInitial());
  Future<void> fetchFeatured() async {
    emit(FeaturedBooksLoading());
    var res = await featuredBooksUseCase.call();
    res.fold((failure) => emit(FeaturedBooksFailure(failure)),
        (books) => emit(FeaturedBooksSuccess(books)));
  }
  
}
