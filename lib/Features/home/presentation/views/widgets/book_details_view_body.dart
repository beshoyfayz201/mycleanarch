import 'package:bookly/Features/home/domain/entity/book_entity.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'books_details_sectioni.dart';
import 'custom_book_details_app_bar.dart';

class BookDetailsViewBody extends StatelessWidget {
  final BookEntity b;
  const BookDetailsViewBody(this.b, {super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                const CustomBookDetailsAppBar(),
                BookDetailsSection(b),
                const Expanded(
                  child: SizedBox(
                    height: 50,
                  ),
                ),
                //     const SimilarBooksSection(),
                // const SizedBox(
                //   height: 40,
                // ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
