import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/home/presentation/manager/cubit/fetch_featured_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/best_seller_list_view.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_books_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20.0,
                ),
                child: CustomAppBar(),
              ),
              SizedBox(
                height: 40,
              ),
              CustomBooksListViewBloc(),
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Best Seller',
                  style: Styles.fontStyle20,
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
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: BestSellerListView(),
          ),
        )
      ],
    );
  }
}

class CustomBooksListViewBloc extends StatelessWidget {
  const CustomBooksListViewBloc({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchFeaturedBooksCubit, FetchFeaturedBooksState>(
      builder: (context, state) {
        if (state is FetchFeaturedBooksSuccess) {
          return const CustomBooksListView();
        } else if (state is FetchFeaturedBooksFailure) {
          return Text(state.errMessage);
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
