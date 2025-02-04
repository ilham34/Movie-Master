import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:netflix_app/core/constants/api_url.dart';
import 'package:netflix_app/core/network/dio_client.dart';
import 'package:netflix_app/data/auth/models/signin_req_params.dart';
import 'package:netflix_app/service_locator.dart';

import '../models/signup_req_params.dart';

abstract class AuthApiService {
  Future<Either> signIn(SignInReqParams params);
  Future<Either> signUp(SignUpReqParams params);
}

class AuthApiServiceImpl implements AuthApiService {
  @override
  Future<Either> signIn(SignInReqParams params) async {
    try {
      var response = await sl<DioClient>().post(
        ApiUrl.signIn,
        data: params.toMap()
      );
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response?.data['message']);
    }
  }

  @override
  Future<Either> signUp(SignUpReqParams params) async {
    try {
      var response = await sl<DioClient>().post(
        ApiUrl.signUp,
        data: params.toMap()
      );
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response?.data['message']);
    }
  }
}
