import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_app/common/bloc/generic_data_cubit.dart';
import 'package:netflix_app/common/bloc/generic_data_state.dart';
import 'package:netflix_app/common/widgets/home_page/shimmer_card.dart';
import 'package:netflix_app/common/widgets/tv_card.dart';
import 'package:netflix_app/domain/tv/entities/tv_entity.dart';
import 'package:netflix_app/domain/tv/usecase/get_popular_tv.dart';
import 'package:netflix_app/service_locator.dart';

class PopularTv extends StatelessWidget {
  const PopularTv({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GenericDataCubit()..getData<List<TvEntity>>(sl<GetPopularTvUsecase>()),
      child: BlocBuilder<GenericDataCubit, GenericDataState>(
        builder: (context, state) {
          if (state is DataLoading) {
            return const ShimmerCard();
          }
          if (state is DataLoaded) {
            return SizedBox(
              height: 400,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return TvCard(tvEntity: state.data[index]);
                },
                separatorBuilder: (context, index) => const SizedBox(width: 20),
                itemCount: state.data.length,
              ),
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
