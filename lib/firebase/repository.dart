import 'package:burgerapp/firebase/firebase_helper.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthResult {
  final bool firebase_result;
  final String? message;

  AuthResult({required this.firebase_result, required this.message});
}

class Repository extends FirebaseHelper {
  FirebaseAuth auth = FirebaseAuth.instance;

  Future<AuthResult> Login({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential usr = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (usr.user != null) {
        await usr.user?.reload();
        return AuthResult(firebase_result: true, message: null);
      } else {
        return AuthResult(firebase_result: false, message: 'User not Found');
      }
    } on FirebaseException catch (e) {
      return AuthResult(firebase_result: false, message: geterrorMessage(e));
    }
  }

  Future<AuthResult> Register({
    required String email,
    required String password,
    required String fullname,
  }) async {
    try {
      UserCredential usr = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (usr.user != null) {
        await usr.user?.updateDisplayName(fullname);

        await usr.user?.reload();
        return AuthResult(firebase_result: true, message: null);
      } else {
        return AuthResult(firebase_result: false, message: 'User not Found');
      }
    } on FirebaseException catch (e) {
      return AuthResult(firebase_result: false, message: geterrorMessage(e));
    }
  }

  Future<AuthResult> ForgotPassword({required String email}) async {
    try {
      await auth.sendPasswordResetEmail(email: email);

      return AuthResult(
        firebase_result: true,
        message:
            'If an account exists for $email, a password reset link has been sent to your inbox. Please check your spam folder as well.',
      );
    } on FirebaseException catch (e) {
      return AuthResult(firebase_result: false, message: geterrorMessage(e));
    } catch (e) {
      // Catch any other unexpected errors
      return AuthResult(
        firebase_result: false,
        message:
            'An unexpected error occurred: ${e.toString()}. Please try again later.',
      );
    }
  }

  Future<void> SignOut() async {
    await auth.signOut();
  }
}
