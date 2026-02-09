import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/components/email_address.dart';
import '../../domain/components/password.dart';
import '../../domain/usecase/login_usecase.dart';
import '../../domain/usecase/register_user.dart';
import '../state/auth_state.dart';

class AuthBloc extends Cubit<AuthState> {
  final LoginUser loginUser;
  final RegisterUser registerUser;

  AuthBloc({required this.loginUser, required this.registerUser})
    : super(const AuthState());

  Future<void> login(String email, String password) async {
    final emailVO = EmailAddress.tryParse(email);
    final passVO = Password.tryCreate(password);

    if (emailVO == null) {
      emit(
        state.copyWith(
          error: "Invalid email format",
          loading: false,
          authenticated: false,
        ),
      );
      return;
    }
    if (passVO == null) {
      emit(
        state.copyWith(
          error: "Password must be at least 6 chars",
          loading: false,
          authenticated: false,
        ),
      );
      return;
    }

    emit(state.copyWith(loading: true, error: null));
    final ok = await loginUser(email: emailVO.value, password: passVO.value);
    if (ok) {
      emit(state.copyWith(loading: false, authenticated: true));
    } else {
      emit(
        state.copyWith(
          loading: false,
          error: "Invalid credentials",
          authenticated: false,
        ),
      );
    }
  }

  Future<void> register(String email, String password) async {
    final emailVO = EmailAddress.tryParse(email);
    final passVO = Password.tryCreate(password);
    if (emailVO == null) {
      emit(state.copyWith(error: "Invalid email format"));
      return;
    }

    if (passVO == null) {
      emit(state.copyWith(error: "Password must be at least 6 chars"));
      return;
    }

    emit(state.copyWith(
      loading: true,
      error: null,
      registrationSuccess: false,
    ));

    await registerUser(
      email: emailVO.value,
      password: passVO.value,
    );

    emit(state.copyWith(
      loading: false,
      registrationSuccess: true,
    ));
  }

  void clearError() => emit(state.copyWith(error: null));
}
