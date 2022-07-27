part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class LoadingState extends AuthState {}

class SignOutState extends AuthState {}

class UpdateProfileState extends AuthState {
  final String message;

  UpdateProfileState(this.message);
}

class GetUserProfileState extends AuthState {
  final UserResponse userResponse;

  GetUserProfileState(this.userResponse);
}

class SignUpSuccessState extends AuthState {
  final String message;

  SignUpSuccessState(this.message);
}

class SignUpErrorState extends AuthState {
  final String error;

  SignUpErrorState(this.error);
}

class SignInSuccessState extends AuthState {
  final String message;

  SignInSuccessState(this.message);
}

class SignInErrorState extends AuthState {
  final String error;

  SignInErrorState(this.error);
}
