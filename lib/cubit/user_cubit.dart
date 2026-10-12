// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:api_test/core/api/endpoints.dart';
import 'package:api_test/core/errors/exceptions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import 'package:api_test/core/api/api_consumer.dart';

import 'package:api_test/cubit/user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit(this.api) : super(UserInitial());
  final ApiConsumer api;
  //Sign in Form key
  GlobalKey<FormState> signInFormKey = GlobalKey();
  //Sign in email
  TextEditingController signInUserName = TextEditingController();
  //Sign in password
  TextEditingController signInPassword = TextEditingController();
  //Sign Up Form key
  GlobalKey<FormState> signUpFormKey = GlobalKey();
  //Profile Pic
  XFile? profilePic;
  //Sign up name
  TextEditingController signUpName = TextEditingController();
  //Sign up phone number
  TextEditingController signUpPhoneNumber = TextEditingController();
  //Sign up email
  TextEditingController signUpEmail = TextEditingController();
  //Sign up password
  TextEditingController signUpPassword = TextEditingController();
  //Sign up confirm password
  TextEditingController confirmPassword = TextEditingController();

signIn()async{
  emit(SignInLoading());
  try {
    final repo= await api.post(
      Endpoints.signin,
      data:{
        ApiKeys.userName:signInUserName.text.trim(),
        ApiKeys.password:signInPassword.text.trim()
      }
    );
    print(repo);
    emit(SignInSuccess());
  } on ServerException catch (e) {
    emit(SignInFailure(errorMessage: e.errorModel.message));
  }
}
}
