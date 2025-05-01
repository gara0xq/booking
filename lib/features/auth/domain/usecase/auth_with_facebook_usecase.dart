import '../repo/auth_repo.dart';

class AuthWithFacebookUsecase {
  final AuthRepo _authRepo;
  AuthWithFacebookUsecase(this._authRepo);
  Future<String> call() async {
    return await _authRepo.authWithFacebook();
  }
}
