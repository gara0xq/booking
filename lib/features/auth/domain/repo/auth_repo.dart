abstract class AuthRepo {
  Future<String> authWithEmailAndPassword(email, password);
  Future<String> authWithGoogle();
  Future<String> authWithFacebook();
}
