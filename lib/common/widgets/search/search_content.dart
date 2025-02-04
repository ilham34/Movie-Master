import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_app/common/widgets/movie_card.dart';
import 'package:netflix_app/common/widgets/tv_card.dart';
import 'package:netflix_app/presentation/search/bloc/search_state.dart';
import 'package:netflix_app/presentation/search/bloc/search_cubit.dart';

class SearchContent extends StatelessWidget {
  const SearchContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is MovieLoaded) {
          return GridView.builder(
            itemCount: state.movies.length,
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.6,
            ),
            itemBuilder: (context, index) {
              return MovieCard(movieEntity: state.movies[index]);
            },
          );
        }
        if (state is TvLoaded) {
          return GridView.builder(
            itemCount: state.tv.length,
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.6,
            ),
            itemBuilder: (cotext, index) {
              return TvCard(tvEntity: state.tv[index]);
            },
          );
        }
        if (state is SearchError) {
          return Center(child: Text(state.errorMessage));
        }
        return Container();
      },
    );
  }
}
