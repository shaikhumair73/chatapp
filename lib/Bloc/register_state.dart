part of 'register_bloc.dart';

@immutable
abstract class RegisterState {}

class RegisterInitial extends RegisterState {}
class OnLoading extends RegisterState {}
class OnLoaded extends RegisterState {}
class OnError extends RegisterState {
  String error;
  OnError({required this.error});
}
