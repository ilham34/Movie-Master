import 'package:dartz/dartz.dart';
import 'package:netflix_app/domain/auth/repositories/auth.dart';
import 'package:netflix_app/service_locator.dart';

import '../../../core/usecase/usecase.dart';
import '../../../data/auth/models/signup_req_params.dart';

class SignUpUsecase implements Usecase<Either, SignUpReqParams> {
  @override
  Future<Either> call({SignUpReqParams? params}) async {
    return await sl<AuthRepository>().signUp(params!);
  }

}