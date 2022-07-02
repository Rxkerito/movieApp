import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(UserNotLogged()) {
    checkState(state);
  }

  Future<void> logIn(LoginState state, String email, String password) async {
    if (state is UserNotLogged) {
      if (FirebaseAuth.instance.currentUser?.uid == null) {
        if (state.logIn(email, password) == true) {
          emit(UserLogged());
        }
      } else
        emit(UserLogged());
    }
  }

  Future<void> signIn(LoginState state, String email, String password) async {
    if (state is UserNotLogged) {
      if (state.SignIn(email, password) == true) {
        emit(UserLogged());
      }
    }
  }

  bool checkState(LoginState state) {
    if (FirebaseAuth.instance.currentUser?.uid != null) {
      emit(UserLogged());
      return true;
    }
    return false;
  }

  Future<void> signOut(LoginState state) async {
    if (state is UserLogged) {
      state.signOut();
      emit(UserNotLogged());
    }
  }
}
