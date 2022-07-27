import 'package:chat_app/cubit/login_cubit/login_states.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);

  bool isPassword = true;
  IconData passwordIcon = Icons.visibility_off;

  changePasswordState() {
    isPassword = !isPassword;
    passwordIcon = isPassword ? Icons.visibility_off : Icons.visibility;
    emit(LoginChangePasswordVisibility());
  }


  void login({
    required String email,
    required String password,
  }) {
    emit(LoginLoadingState());
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      print(value.user!.email);
      emit(LoginSuccessState());
    }).catchError((error) {
      print(
        error.toString(),
      );
      emit(LoginErrorState());
    });
  }
}
