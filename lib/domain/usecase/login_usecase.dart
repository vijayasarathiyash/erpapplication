import '../../data/network/login_response.dart';
import '../../data/repository/auth_repostary.dart';

class LoginUseCase {
  final AuthRepository repository;

  LoginUseCase(this.repository);

  Future<LoginResponse> execute(
      String email,
      String password,
      ) {
    return repository.login(email, password);
  }
}