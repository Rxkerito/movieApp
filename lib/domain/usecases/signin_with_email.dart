import 'package:firebase_auth/firebase_auth.dart';

class SignInWithEmailUseCase {
  Future<bool> signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
          email: email,
          password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
    if (FirebaseAuth.instance.currentUser?.uid != null) {
      return true;
//  logged
    }
    return false;
  }
}
