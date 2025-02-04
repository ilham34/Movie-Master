abstract class SplashState {}

class DisplaySplash extends SplashState {}

class Authenticated extends SplashState {}

class Unauthenticated extends SplashState {
  final bool isHide;
  Unauthenticated({required this.isHide});
}