part of 'user_cubit.dart';

@immutable
abstract class UserState {}

class UserInitial extends UserState {}

class SignInLoadingState extends UserState {}
class SignInSuccessState extends UserState {}
class SignInFailedState extends UserState {
  final String errorMessage;
  SignInFailedState({required this.errorMessage});
}
