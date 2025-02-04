import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:netflix_app/common/helper/navigation/app_navigation.dart';
import 'package:netflix_app/common/widgets/app_bar.dart';
import 'package:netflix_app/common/widgets/home_page/now_playing.dart';
import 'package:netflix_app/common/widgets/home_page/trending_movie.dart';
import 'package:netflix_app/common/widgets/home_page/popular_tv.dart';
import 'package:netflix_app/core/configs/assets/app_images.dart';
import 'package:netflix_app/presentation/auth/pages/signin.dart';
import 'package:netflix_app/presentation/search/pages/search.dart';
import 'package:netflix_app/presentation/splash/bloc/splash_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(
        leading: IconButton(
          onPressed: () {
            context.read<SplashCubit>().logout();
            AppNavigation.pushAndRemove(context, SignInPage());
          },
          icon: const Icon(Icons.logout_rounded),
        ),
        hideBack: true,
        action: IconButton(
          onPressed: () {
            AppNavigation.push(context, const SearchPage());
          },
          icon: const Icon(Icons.search),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              AppImages.logo,
              color: Colors.white,
              height: 50,
              fit: BoxFit.fill,
            ),
            const SizedBox(width: 12),
            const Text(
              "Movie Master",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      body: const SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TitleText(title: 'Trendings 🔥'),
            SizedBox(height: 8),
            TrendingMovies(),
            SizedBox(height: 16),
            TitleText(title: 'Now Playing'),
            Padding(
              padding: EdgeInsets.only(top: 16, left: 20),
              child: NowPlaying(),
            ),
            TitleText(title: 'Popular Tv Shows'),
            Padding(
              padding: EdgeInsets.only(top: 16, left: 20),
              child: PopularTv(),
            ),
          ],
        ),
      ),
    );
  }
}

class TitleText extends StatelessWidget {
  final String title;
  const TitleText({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
      ),
    );
  }
}
