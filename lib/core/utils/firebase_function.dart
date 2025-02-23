import 'package:evently_app/core/services/snack_bar_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class FirebaseFunctions {
  static Future<bool> createAccount({
    required String emailAddress,
    required String password,
  }) async {
    EasyLoading.show();
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      SnackBarService.showSuccessMessage("Account created successfully");
      return Future.value(true);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        SnackBarService.showErrorMessage(e.message ?? 'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        SnackBarService.showErrorMessage(e.message ?? 'The email provided is already in use.');
      }
      return Future.value(false);
    } catch (e) {
      SnackBarService.showErrorMessage('An unexpected error occured.');
      return Future.value(false);
    }
  }

  static Future<bool> login({
    required String emailAddress,
    required String password,
  }) async {
    EasyLoading.show();
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: emailAddress, password: password);
      SnackBarService.showSuccessMessage("Logged In successfully");
      return Future.value(true);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        SnackBarService.showErrorMessage(e.message ?? 'The email was not found.');
        return Future.value(false);
      } else if (e.code == 'wrong-password') {
        SnackBarService.showErrorMessage(e.message ?? 'The password provided is incorrect.');
        return Future.value(false);
      }
      return Future.value(false);
    } catch (e) {
      SnackBarService.showErrorMessage('An unexpected error occured.');
      return Future.value(false);
    }
  }
}
