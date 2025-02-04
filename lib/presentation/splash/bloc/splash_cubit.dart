import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_app/domain/auth/usecases/is_logged_in.dart';
import 'package:netflix_app/presentation/splash/bloc/splash_state.dart';
import 'package:netflix_app/service_locator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(DisplaySplash());

  bool isHide = true;

  void appStarted() async {
    await Future.delayed(const Duration(seconds: 2));
    final isLoggedIn = await sl<IsLoggedInUsecase>().call();
    if (isLoggedIn) {
      emit(Authenticated());
    } else {
      emit(Unauthenticated(isHide: isHide));
    }
  }

  void logout() async {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.remove('token');
    emit(Unauthenticated(isHide: isHide));
  }

  void toggleHide() {
    isHide = !isHide;
    emit(Unauthenticated(isHide: isHide));
  }
}
