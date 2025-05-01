import 'package:firebase_auth/firebase_auth.dart';

class Signin {
  FirebaseAuth auth;
  Signin(this.auth);

  Future<UserCredential?> signinWithEmailAndPassword(
      String email, String password) async {
    UserCredential userCredential = await auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    return userCredential;
  }
}
