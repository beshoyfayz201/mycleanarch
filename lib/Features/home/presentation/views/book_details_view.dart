import 'package:bookly/Features/home/domain/entity/book_entity.dart';
import 'package:bookly/Features/home/presentation/views/widgets/book_details_view_body.dart';
import 'package:flutter/material.dart';

class BookDetailsView extends StatelessWidget {
  final BookEntity bookModel;
  const BookDetailsView({super.key,required this.bookModel});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: BookDetailsViewBody(bookModel),
      ),
    );
  }
}
