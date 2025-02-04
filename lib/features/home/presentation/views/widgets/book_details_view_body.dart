import 'package:bookly_app/core/widgets/custom_button.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_rating.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_book_details_app_bar.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_book_item.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/similar_books_list_view.dart';
import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Column(
            children: [
              const CustomBookDetailsAppBar(),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: width * 0.25,
                ),
                child: const CustomBookItem(),
              ),
              const SizedBox(
                height: 40,
              ),
              const Text(
                'The Jungle Book',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 4,
              ),
              const Opacity(
                opacity: 0.8,
                child: Text(
                  'Rudyard Kipling',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const BookRating(),
              const SizedBox(
                height: 46,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: BookDetailsButton(),
              ),
              const Expanded(
                child: SizedBox(
                  height: 20,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'You can Also Like ',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const SimilarBooksListView(),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        )
      ],
    );
  }
}

class BookDetailsButton extends StatelessWidget {
  const BookDetailsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          child: CustomButton(
            textColor: Colors.black,
            backgroundColor: Colors.white,
            text: '19.99 €',
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              bottomRight: Radius.circular(12),
            ),
          ),
        ),
        Expanded(
          child: CustomButton(
            textColor: Colors.white,
            backgroundColor: Color(0xffEF8262),
            text: 'Free preview',
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
          ),
        ),
      ],
    );
  }
}
