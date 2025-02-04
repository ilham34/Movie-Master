import 'package:dartz/dartz.dart';

import '../../../data/auth/models/signin_req_params.dart';
import '../../../data/auth/models/signup_req_params.dart';

abstract class AuthRepository {
  Future<Either> signIn(SignInReqParams params);
  Future<Either> signUp(SignUpReqParams params);
  Future<bool> isLoggedIn();
}
