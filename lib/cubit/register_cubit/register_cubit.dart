import 'package:chat_app/cubit/register_cubit/register_states.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInitialState());

  static RegisterCubit get(context) => BlocProvider.of(context);

  bool isPassword = true;
  IconData passwordIcon = Icons.visibility_off;

  changePasswordState() {
    isPassword = !isPassword;
    passwordIcon = isPassword ? Icons.visibility_off : Icons.visibility;
    emit(RegisterChangePasswordVisibility());
  }

  void register({
    required String name,
    required String email,
    required String password,
    required String phone,
  }) {
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: email,
      password: password,
    )
        .then((value) {
      print(value.user!.email);
      emit(RegisterSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(
        RegisterErrorState(error),
      );
    });
  }
}
