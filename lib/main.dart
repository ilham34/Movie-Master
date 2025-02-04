import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:netflix_app/presentation/splash/pages/splash.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_app/service_locator.dart';
import 'core/configs/theme/app_theme.dart';
import 'presentation/splash/bloc/splash_cubit.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      )
    );
    return BlocProvider(
      create: (context) => SplashCubit()..appStarted(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.appTheme,
        home: const SplashPage(),
      ),
    );
  }
}
