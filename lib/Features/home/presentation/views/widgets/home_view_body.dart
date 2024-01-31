import 'package:bookly/Features/home/presentation/control/fetured_books_cubit/featured_books_cubit.dart';
import 'package:bookly/Features/home/presentation/control/newest_book_cubit/newest_books_cubit_cubit.dart';
import 'package:bookly/Features/home/presentation/control/newest_book_cubit/newest_books_cubit_state.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'best_seller_list_view.dart';
import 'custom_app_bar.dart';
import 'featured_list_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 30,
                  ),
                  child: CustomAppBar()),
              FeaturedBooksListViewBlocBuilder(),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  'Best Seller',
                  style: Styles.textStyle18,
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
        SliverFillRemaining(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: BlocBuilder<NewestBooksCubit, NewestBooksState>(
              builder: (context, state) {
                if (state is NewestBooksSuccess) {
                  return BestSellerListView(state.books);
                } else if (state is NewestBooksFailure) {
                  return Text(state.failure.message);
                } else {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 130, vertical: 180),
                    child: const CircularProgressIndicator(),
                  );
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}

class FeaturedBooksListViewBlocBuilder extends StatelessWidget {
  const FeaturedBooksListViewBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if ((state is FeaturedBooksSuccess)) {
          return FeaturedBooksListView(books: state.books);
        } else if (state is FeaturedBooksFailure) {
          return Center(child: Text(state.failure.message));
        } else {
          return const LinearProgressIndicator();
        }
      },
    );
  }
}
