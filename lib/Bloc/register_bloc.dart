import 'dart:async';

import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:chatapp/costum/Model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../firebase_provider.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  FirebaseProvider firebaseProvider;
  RegisterBloc({required this.firebaseProvider}) : super(RegisterInitial()) {
    on<AuthenticateAccount>((event, emit) {
      try {
        emit(OnLoading());
        firebaseProvider.authenticateUser(
          email: event.mail,
          mPass: event.pass,
        );
        emit(OnLoaded());
      } catch (e) {
        emit(OnError(error: e.toString()));
      }
    });

    on<Createaccount>((event, emit) async {
      try {
        emit(OnLoading());
        await firebaseProvider.creatUser(
            usermodel: event.dataModel, mPass: event.pass);
        emit(OnLoaded());
      } catch (e) {
        emit(OnError(error: e.toString()));
      }
    });
  }
}
