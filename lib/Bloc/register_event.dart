part of 'register_bloc.dart';

@immutable
abstract class RegisterEvent {}

class Createaccount extends RegisterEvent {
  Usermodel dataModel;
  String pass;
  Createaccount({required this.dataModel, required this.pass});
}

class AuthenticateAccount extends RegisterEvent {
  String mail;
  String pass;
  AuthenticateAccount({required this.mail, required this.pass});
}
