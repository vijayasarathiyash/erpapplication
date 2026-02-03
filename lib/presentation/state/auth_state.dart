import '../../data/network/login_response.dart';

class AuthState {
  final bool loading;
  final LoginResponse? data;
  final String? error;

  const AuthState({
    this.loading = false,
    this.data,
    this.error,
  });

  AuthState copyWith({
    bool? loading,
    LoginResponse? data,
    String? error,
  }) {
    return AuthState(
      loading: loading ?? this.loading,
      data: data ?? this.data,
      error: error,
    );
  }
}
