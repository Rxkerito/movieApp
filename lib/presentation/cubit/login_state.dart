import 'package:firebase_auth/firebase_auth.dart';
import 'package:practice/domain/usecases/signout.dart';
import '../../domain/usecases/create_user_with_email.dart';
import '../../domain/usecases/signin_with_email.dart';

abstract class LoginState {}

class UserLogged extends LoginState {
  final FirebaseAuth auth = FirebaseAuth.instance;
  late final User? user;
  late final email;
  SignOutUseCase _signOutUseCase = SignOutUseCase();

  UserLogged(){
    this.user = auth.currentUser;
    this.email = user?.email;
  }

  Future<void> signOut() async {
    _signOutUseCase.signOut();
  }
}

class UserNotLogged extends LoginState {
  SignInWithEmailUseCase _signInWithEmailUseCase = SignInWithEmailUseCase();
  CreateUserWithEmailUsecase _createUserWithEmailUsecase =
      CreateUserWithEmailUsecase();

  Future<bool> logIn(String email, String password) async {
    if (_signInWithEmailUseCase.signInWithEmailAndPassword(email, password) ==
        true) return true;
    return false;
  }

  Future<bool> SignIn(String email, String password) async {
    if (_createUserWithEmailUsecase.createUserWithEmailAndPassword(
            email, password) ==
        true) return true;
    return false;
  }
}
