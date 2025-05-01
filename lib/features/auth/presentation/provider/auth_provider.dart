import 'package:get/get.dart';
import '../../data/repo_impl/auth_repo_impl.dart';
import '../../domain/usecase/auth_with_email_usecase.dart';
// import '../../domain/usecase/auth_with_facebook_usecase.dart';
import '../../domain/usecase/auth_with_google_usecase.dart';

class AuthProvider extends GetxController {
  final AuthWithEmailUsecase _authWithEmailUsecase;
  final AuthWithGoogleUsecase _authWithGoogleUsecase;
  // final AuthWithFacebookUsecase _authWithFacebookUsecase;

  AuthProvider()
      : _authWithEmailUsecase = AuthWithEmailUsecase(AuthRepoImpl()),
        // _authWithFacebookUsecase = AuthWithFacebookUsecase(AuthRepoImpl()),
        _authWithGoogleUsecase = AuthWithGoogleUsecase(AuthRepoImpl());
  RxBool isLoading = false.obs;
  void loginWithGoogle() {
    isLoading.value = true;
    Future.delayed(const Duration(seconds: 20), () {
      if (isLoading.value) {
        Get.snackbar("Error", "Login failed");
        isLoading.value = false;
      }
    });
    _authWithGoogleUsecase.call().then((value) {
      if (value.isEmpty) {
        isLoading.value = false;
        Get.snackbar("Success", "Login with Google successful");
      } else {
        Get.snackbar("Error", value);
      }
    });
  }

  authWithEmail(String email, String password) {
    isLoading.value = true;
    Future.delayed(const Duration(seconds: 20), () {
      if (isLoading.value) {
        Get.snackbar("Error", "Login failed");
        isLoading.value = false;
      }
    });
    _authWithEmailUsecase.call(email, password).then(
      (value) {
        if (value.isEmpty) {
          isLoading.value = false;
          Get.rootDelegate.offAndToNamed("/");
        } else {
          Get.snackbar("Error", value);
        }
      },
    );
  }
}
