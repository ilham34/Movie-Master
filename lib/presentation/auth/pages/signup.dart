import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:netflix_app/common/helper/message/display_message.dart';
import 'package:netflix_app/common/helper/navigation/app_navigation.dart';
import 'package:netflix_app/core/configs/assets/app_images.dart';
import 'package:netflix_app/data/auth/models/signup_req_params.dart';
import 'package:netflix_app/domain/auth/usecases/signup.dart';
import 'package:netflix_app/presentation/splash/bloc/splash_cubit.dart';
import 'package:netflix_app/presentation/splash/bloc/splash_state.dart';
import 'package:netflix_app/service_locator.dart';
import 'package:reactive_button/reactive_button.dart';

import '../../../core/configs/theme/app_colors.dart';
import 'signin.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          minimum: const EdgeInsets.only(top: 100, right: 16, left: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _signUpText(),
              const SizedBox(height: 30),
              Lottie.asset(
                AppImages.signup,
                height: 200,
                width: 300,
              ),
              const SizedBox(height: 30),
              _emailForm(),
              const SizedBox(height: 20),
              _passwordForm(),
              const SizedBox(height: 60),
              _signUpButton(context),
              const SizedBox(height: 20),
              _signInText(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _signUpText() {
    return const Text(
      'Sign Up',
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

  Widget _passwordForm() {
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

  Widget _signUpButton(BuildContext context) {
    return ReactiveButton(
      title: 'Sign Up',
      activeColor: AppColors.primary,
      onPressed: () async => sl<SignUpUsecase>().call(
        params: SignUpReqParams(
          email: _emailController.text,
          password: _passwordController.text,
        ),
      ),
      onSuccess: () {
        AppNavigation.pushAndRemove(context, SignInPage());
      },
      onFailure: (error) {
        DisplayMessage.errorMessage(error, context);
      },
    );
  }

  Widget _signInText(BuildContext context) {
    return Text.rich(TextSpan(
      children: [
        const TextSpan(
          text: 'Do you have an account? ',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        TextSpan(
          text: 'Sign In',
          style: const TextStyle(
            color: Colors.blue,
          ),
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              AppNavigation.push(context, SignInPage());
            },
        ),
      ],
    ));
  }
}
