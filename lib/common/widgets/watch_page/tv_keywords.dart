import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:netflix_app/common/bloc/generic_data_cubit.dart";
import "package:netflix_app/common/bloc/generic_data_state.dart";
import "package:netflix_app/domain/tv/entities/tv_keyword_entity.dart";
import "package:netflix_app/domain/tv/usecase/get_tv_keywords.dart";
import "package:netflix_app/service_locator.dart";

class TvKeywords extends StatelessWidget {
  final int tvId;
  const TvKeywords({required this.tvId, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GenericDataCubit()..getData(sl<GetTvKeywords>(), params: tvId),
      child: BlocBuilder<GenericDataCubit, GenericDataState>(
        builder: (context, state) {
          if (state is DataLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is DataLoaded) {
            List<KeywordsEntity> keywords = state.data;

            return Wrap(
              spacing: 10,
              children: keywords
                  .take(8)
                  .map((item) => Chip(
                        label: Text(item.name!),
                      ))
                  .toList(),
            );
          }
          if (state is DataError) {
            return Center(
              child: Text(
                state.errorMessage,
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}
