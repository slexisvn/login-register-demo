part of 'login_cubit.dart';

class LoginState extends Equatable {
  const LoginState({
    this.status = FormStatus.pure,
    this.errorMessage,
  });

  final FormStatus status;
  final String? errorMessage;

  @override
  List<Object> get props => [status];

  LoginState copyWith({
    FormStatus? status,
    String? errorMessage,
  }) {
    return LoginState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
