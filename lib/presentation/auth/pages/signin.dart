import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:netflix_app/common/helper/message/display_message.dart';
import 'package:netflix_app/common/helper/navigation/app_navigation.dart';
import 'package:netflix_app/core/configs/assets/app_images.dart';
import 'package:netflix_app/data/auth/models/signin_req_params.dart';
import 'package:netflix_app/domain/auth/usecases/signin.dart';
import 'package:netflix_app/presentation/home/pages/home.dart';
import 'package:netflix_app/presentation/splash/bloc/splash_cubit.dart';
import 'package:netflix_app/presentation/splash/bloc/splash_state.dart';
import 'package:netflix_app/service_locator.dart';
import 'package:reactive_button/reactive_button.dart';

import '../../../core/configs/theme/app_colors.dart';
import 'signup.dart';

class SignInPage extends StatelessWidget {
  SignInPage({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.only(top: 80, right: 16, left: 16),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _signInText(),
              const SizedBox(height: 30),
              Lottie.asset(
                AppImages.signin,
                height: 200,
                width: 300,
              ),
              const SizedBox(height: 30),
              _emailForm(),
              const SizedBox(height: 20),
              _passwordForm(context),
              const SizedBox(height: 60),
              _signInButton(context),
              const SizedBox(height: 20),
              _signUpText(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _signInText() {
    return const Text(
      'Sign In',
      style: TextStyle(
        fontSize: 24,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _emailForm() {
    return TextField(
      controller: _emailController,
      decoration: const InputDecoration(
        hintText: 'Email',
      ),
    );
  }

  Widget _passwordForm(BuildContext context) {
    return BlocBuilder<SplashCubit, SplashState>(
      builder: (context, state) {
        if (state is Unauthenticated) {
          return TextField(
            controller: _passwordController,
            obscureText: state.isHide,
            decoration: InputDecoration(
              hintText: 'Password',
              suffixIcon: IconButton(
                onPressed: () => context.read<SplashCubit>().toggleHide(),
                icon: Icon(state.isHide ? Icons.visibility_off_outlined : Icons.visibility_outlined),
              ),
            ),
          );
        }
        return Container();
      },
    );
  }

  Widget _signInButton(BuildContext context) {
    return ReactiveButton(
      title: 'Sign In',
      activeColor: AppColors.primary,
      onPressed: () async => sl<SignInUsecase>().call(
        params: SignInReqParams(
          email: _emailController.text,
          password: _passwordController.text,
        ),
      ),
      onSuccess: () {
        AppNavigation.pushAndRemove(context, const HomePage());
      },
      onFailure: (error) {
        DisplayMessage.errorMessage(error, context);
      },
    );
  }

  Widget _signUpText(BuildContext context) {
    return Text.rich(TextSpan(
      children: [
        const TextSpan(
          text: 'Don\'t have an account? ',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        TextSpan(
          text: 'Sign Up',
          style: const TextStyle(
            color: Colors.blue,
          ),
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              AppNavigation.push(context, SignUpPage());
            },
        ),
      ],
    ));
  }
}
