// Package imports:
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

// Project imports:
import '../../enums/enums.dart';
import '../../repos/repos.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._authenticationRepository) : super(const LoginState());

  final AuthenticationRepository _authenticationRepository;

  Future<void> logInWithCredentials(
      {required Map<String, dynamic> formValue}) async {
    emit(state.copyWith(status: FormStatus.submissionInProgress));
    try {
      await _authenticationRepository.logInWithEmailAndPassword(
        email: formValue['email'],
        password: formValue['password'],
      );
      emit(state.copyWith(status: FormStatus.submissionSuccess));
    } on LogInWithEmailAndPasswordFailure catch (e) {
      emit(
        state.copyWith(
          errorMessage: e.message,
          status: FormStatus.submissionFailure,
        ),
      );
    } catch (_) {
      emit(state.copyWith(status: FormStatus.submissionFailure));
    }
  }
}
