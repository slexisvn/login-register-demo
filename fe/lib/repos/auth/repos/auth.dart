// Dart imports:
import 'dart:async';

// Package imports:
import 'package:dio/dio.dart';

// Project imports:
import '../../../enums/enums.dart';
import '../../../helper/helper.dart';

class AuthenticationRepository {
  final _controller = StreamController<AppStatus>();

  Stream<AppStatus> get status async* {
    await Future<void>.delayed(const Duration(seconds: 1));
    yield* _controller.stream;
  }

  Future<void> logInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final formData = FormData.fromMap({
        'username': email,
        'password': password,
      });

      final response = await DioHelper.post('/login', data: formData);

      await PrefsHelper.setString('access_token', response.data.toString());

      _controller.add(AppStatus.authenticated);
    } on DioError catch (e) {
      throw LogInWithEmailAndPasswordFailure.fromCode(
        e.response!.data,
      );
    } catch (_) {
      throw const LogInWithEmailAndPasswordFailure();
    }
  }

  Future<void> logOut() async {
    await PrefsHelper.remove('access_token');
    _controller.add(AppStatus.unauthenticated);
  }

  String get token {
    String? value = PrefsHelper.getString('access_token');
    return value ?? '';
  }

  void dispose() => _controller.close();
}

class LogInWithEmailAndPasswordFailure implements Exception {
  const LogInWithEmailAndPasswordFailure([
    this.message = 'An unknown exception occurred.',
  ]);

  factory LogInWithEmailAndPasswordFailure.fromCode(dynamic response) {
    switch (response['detail']) {
      case 'INACTIVE_USER':
        return const LogInWithEmailAndPasswordFailure(
          'This user has been disabled. Please contact support for help.',
        );
      case 'INCORRECT_EMAIL_OR_PASSWORD':
        return const LogInWithEmailAndPasswordFailure(
          'Email or password is invalid.',
        );
      default:
        return const LogInWithEmailAndPasswordFailure();
    }
  }

  final String message;
}
