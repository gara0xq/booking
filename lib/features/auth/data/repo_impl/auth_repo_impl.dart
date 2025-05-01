import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/utils/secrets.dart';
import '../source/login.dart';
import '../source/signin.dart';
import '../source/insert_user.dart';
import '../../domain/repo/auth_repo.dart';
import '../source/signin_with_google.dart';
import '../source/signin_with_facebook.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepoImpl implements AuthRepo {
  final Login _login = Login(FirebaseAuth.instance);
  final Signin _signin = Signin(FirebaseAuth.instance);
  final SigninWithGoogle _signinWithGoogle =
      SigninWithGoogle(FirebaseAuth.instance);
  final SigninWithFacebook _signinWithFacebook =
      SigninWithFacebook(FirebaseAuth.instance);

  final InsertUser _insertUser = InsertUser(FirebaseFirestore.instance);
  @override
  Future<String> authWithEmailAndPassword(email, password) async {
    try {
      final user = await _signin.signinWithEmailAndPassword(email, password);
      _insertUser
          .insertUserData(
        user!.user!.refreshToken!,
        email,
        "Geust User",
      )
          .then((e) async {
        Secrets.userId = user.user!.refreshToken!;
        final prefs = await SharedPreferences.getInstance();
        prefs.setString("uid", user.user!.refreshToken!);
      });
      return "";
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        final user = await _login.loginWithEmailAndPassword(email, password);
        _insertUser
            .insertUserData(
          user!.user!.refreshToken!,
          email,
          "Geust User",
        )
            .then((e) async {
          Secrets.userId = user.user!.refreshToken!;
          final prefs = await SharedPreferences.getInstance();
          prefs.setString("uid", user.user!.refreshToken!);
        });

        return '';
      } else if (e.code == 'wrong-password') {
        return 'Wrong password';
      } else if (e.code == 'too-many-requests') {
        return 'Too many requests, please try again later';
      } else {
        return e.message ?? "Somthing went wrong";
      }
    }
  }

  @override
  Future<String> authWithGoogle() async {
    try {
      final user = await _signinWithGoogle.signinWithGoogle();
      _insertUser
          .insertUserData(
        user!.user!.refreshToken ?? "",
        "google",
        "Geust User",
      )
          .then((e) async {
        Secrets.userId = user.user!.refreshToken!;
        final prefs = await SharedPreferences.getInstance();
        prefs.setString("uid", user.user!.refreshToken!);
      });
      return "";
    } on FirebaseAuthException catch (e) {
      return e.message ?? "Somthing went wrong";
    }
  }

  @override
  Future<String> authWithFacebook() async {
    try {
      final user = await _signinWithFacebook.signinWithFacebook();
      _insertUser
          .insertUserData(
        user!.user!.refreshToken!,
        "facebook",
        "Geust User",
      )
          .then((e) async {
        Secrets.userId = user.user!.refreshToken!;
        final prefs = await SharedPreferences.getInstance();
        prefs.setString("uid", user.user!.refreshToken!);
      });
      Secrets.userId = user.user!.refreshToken!;
      return "";
    } on FirebaseAuthException catch (e) {
      return e.message ?? "Somthing went wrong";
    }
  }
}
