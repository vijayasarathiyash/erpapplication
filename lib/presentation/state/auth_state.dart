class AuthState {
  final bool loading;
  final String? error;
  final bool authenticated;
  final bool registrationSuccess;
  const AuthState({
    this.loading = false,
    this.error,
    this.authenticated = false,
    this.registrationSuccess = false,
  });

  AuthState copyWith({
    bool? loading,
    String? error,
    bool? authenticated,
    bool? registrationSuccess,
  }) {
    return AuthState(
      loading: loading ?? this.loading,
      error: error,
      authenticated: authenticated ?? this.authenticated,
      registrationSuccess: registrationSuccess ?? false,
    );
  }
}