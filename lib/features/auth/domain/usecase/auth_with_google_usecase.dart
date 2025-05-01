import '../repo/auth_repo.dart';

class AuthWithGoogleUsecase {
  final AuthRepo _authRepo;
  AuthWithGoogleUsecase(this._authRepo);
  Future<String> call() async {
    return await _authRepo.authWithGoogle();
  }
}
