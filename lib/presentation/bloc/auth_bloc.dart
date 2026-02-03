import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecase/login_usecase.dart';
import '../state/auth_state.dart';

class AuthBloc extends Cubit<AuthState> {
  final LoginUseCase loginUseCase;

  AuthBloc(this.loginUseCase) : super(const AuthState());

  Future<void> login(String email, String password) async {
    emit(state.copyWith(loading: true, error: null));

    try {
      final result =
      await loginUseCase.execute(email, password);
      emit(state.copyWith(loading: false, data: result));
    } catch (e) {
      emit(state.copyWith(
        loading: false,
        error: e.toString(),
      ));
    }
  }
}
