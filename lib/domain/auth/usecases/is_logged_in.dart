import 'package:netflix_app/domain/auth/repositories/auth.dart';
import 'package:netflix_app/service_locator.dart';

import '../../../core/usecase/usecase.dart';

class IsLoggedInUsecase implements Usecase<bool, dynamic> {
  @override
  Future<bool> call({params}) async {
    return await sl<AuthRepository>().isLoggedIn();
  }

}