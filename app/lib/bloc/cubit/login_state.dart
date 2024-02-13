part of 'login_cubit.dart';

@immutable
sealed class LoginState {
  const LoginState();
}

final class LoginInitial extends LoginState {}

final class LoginLoading extends LoginState {}

final class LoginSuccess extends LoginState {
  final User user;
  const LoginSuccess(this.user);
}

final class LoginError extends LoginState {
  final LoginFailure error;
  const LoginError(this.error);
}

final class SignInSuccess extends LoginState {
  final User user;
  const SignInSuccess(this.user);
}

final class SignUpSuccess extends LoginState {
  const SignUpSuccess();
}