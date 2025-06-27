// import 'package:firebase_auth/firebase_auth.dart';

// class AuthServices {
//   final FirebaseAuth _auth = FirebaseAuth.instance;

//   Future<String> login({
//     required String email,
//     required String password,
//   }) async {
//     try {
//       await _auth.signInWithEmailAndPassword(
//         email: email.trim(),
//         password: password.trim(),
//       );
//       return "Login Successful";
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'user-not-found') {
//         return "No user found for that email.";
//       } else if (e.code == 'wrong-password') {
//         return "Wrong password provided for that user.";
//       } else if (e.code == 'email-already-in-use') {
//         return "The account already exists for that email.";
//       } else {
//         return "An error occurred: ${e.message}";
//       }
//     } catch (e) {
//       return "An unexpected error occurred: $e";
//     }
//   }
// }
