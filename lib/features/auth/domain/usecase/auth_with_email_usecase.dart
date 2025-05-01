import '../repo/auth_repo.dart';

class AuthWithEmailUsecase {
  final AuthRepo _authRepo;
  AuthWithEmailUsecase(this._authRepo);
  Future<String> call(String email, String password) async {
    return await _authRepo.authWithEmailAndPassword(email, password);
  }
}
