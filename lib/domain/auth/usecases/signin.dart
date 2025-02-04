import 'package:dartz/dartz.dart';
import 'package:netflix_app/data/auth/models/signin_req_params.dart';
import 'package:netflix_app/domain/auth/repositories/auth.dart';
import 'package:netflix_app/service_locator.dart';

import '../../../core/usecase/usecase.dart';

class SignInUsecase implements Usecase<Either, SignInReqParams> {
  @override
  Future<Either> call({SignInReqParams? params}) async {
    return await sl<AuthRepository>().signIn(params!);
  }

}