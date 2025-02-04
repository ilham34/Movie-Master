import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_app/common/widgets/app_bar.dart';
import 'package:netflix_app/common/widgets/search/search_content.dart';
import 'package:netflix_app/common/widgets/search/search_field.dart';
import 'package:netflix_app/common/widgets/search/search_option.dart';
import 'package:netflix_app/presentation/search/bloc/search_cubit.dart';
import 'package:netflix_app/presentation/search/bloc/selectable_option_cubit.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppbar(
        title: Text('Search'),
      ),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => SelectableOptionCubit()),
          BlocProvider(create: (context) => SearchCubit()),
        ],
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            children: [
              SearchField(),
              SizedBox(height: 16),
              SearchOption(),
              SizedBox(height: 16),
              Expanded(child: SearchContent()),
            ],
          ),
        ),
      ),
    );
  }
}
