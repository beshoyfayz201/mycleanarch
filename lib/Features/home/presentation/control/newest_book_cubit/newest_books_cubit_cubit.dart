import 'package:bloc/bloc.dart';
import 'package:bookly/Features/home/domain/usecases/fatch_newest_use_case.dart';
import 'package:bookly/Features/home/presentation/control/newest_book_cubit/newest_books_cubit_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  FetchNewestUseCase fetchNewestUseCase;
  NewestBooksCubit(this.fetchNewestUseCase) : super(NewestBooksInitial());
}
