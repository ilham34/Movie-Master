import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_app/domain/movie/usecases/search_movie.dart';
import 'package:netflix_app/domain/tv/usecase/search_tv.dart';
import 'package:netflix_app/presentation/search/bloc/search_state.dart';
import 'package:netflix_app/presentation/search/bloc/selectable_option_cubit.dart';
import 'package:netflix_app/service_locator.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());

  TextEditingController textEditingController = TextEditingController();

  void search(String query, SearchType searchType) {
    if (query.isNotEmpty) {
      emit(SearchLoading());

      switch (searchType) {
        case SearchType.movie:
          searchMovie(query);
          break;
        case SearchType.tv:
          searchTv(query);
          break;
      }
    } else {
      emit(SearchError(errorMessage: 'Query is Empty'));
    }
  }

  void searchMovie(String query) async {
    var returnedData = await sl<SearchMoviesUsecase>().call(params: query);
    returnedData.fold(
      (error) {
        emit(SearchError(errorMessage: error));
      },
      (data) {
        emit(MovieLoaded(movies: data));
      },
    );
  }

  void searchTv(String query) async {
    var returnedData = await sl<SearchTvUsecase>().call(params: query);
    returnedData.fold(
      (error) {
        emit(SearchError(errorMessage: error));
      },
      (data) {
        emit(TvLoaded(tv: data));
      },
    );
  }
}
