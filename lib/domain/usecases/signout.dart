import 'package:firebase_auth/firebase_auth.dart';

class SignOutUseCase {
  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}