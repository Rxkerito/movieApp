import 'package:firebase_auth/firebase_auth.dart';

class CreateUserWithEmailUsecase {
  Future<bool> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
    if (FirebaseAuth.instance.currentUser?.uid != null) {
      return true;
//  logged
    }
    return false;
  }

// User? user = FirebaseAuth.instance.currentUser;
//
// if (user!= null && !user.emailVerified) {
// await user.sendEmailVerification();
// }
}
