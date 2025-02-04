import 'package:dartz/dartz.dart';
import 'package:netflix_app/data/auth/models/signin_req_params.dart';
import 'package:netflix_app/domain/auth/repositories/auth.dart';
import 'package:netflix_app/service_locator.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/signup_req_params.dart';
import '../sources/auth_api_service.dart';

class AuthRepositoryImpl implements AuthRepository {

  @override
  Future<Either> signIn(SignInReqParams params) async {
    var data = await sl<AuthApiService>().signIn(params);
    return data.fold(
      (error) {
        return Left(error);
      },
      (data) async {
        final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
        sharedPreferences.setString('token', data['user']['token']);
        return Right(data);
      },
    );
  }


  @override
  Future<Either> signUp(SignUpReqParams params) async {
    return await sl<AuthApiService>().signUp(params);
  }
  
  @override
  Future<bool> isLoggedIn() async {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final token = sharedPreferences.getString('token');
    if (token != null) {
      return true;
    }
    return false;
  }
}
