import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_app/core/configs/assets/app_images.dart';

import '../../../common/helper/navigation/app_navigation.dart';
import '../../auth/pages/signin.dart';
import '../../home/pages/home.dart';
import '../bloc/splash_cubit.dart';
import '../bloc/splash_state.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<SplashCubit, SplashState>(
        listener: (context, state) {
          if (state is Unauthenticated) {
            AppNavigation.pushReplacement(context, SignInPage());
          }

          if (state is Authenticated) {
            AppNavigation.pushReplacement(context, const HomePage());
          }
        },
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AppImages.splashBackground),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    const Color(0xff1A1B20).withOpacity(0),
                    const Color(0xff1A1B20),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
