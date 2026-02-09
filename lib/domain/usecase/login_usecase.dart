import '../../data/repository/auth_repository.dart';

class LoginUser {
  final AuthRepository repository;

  LoginUser(this.repository);

  Future<bool> call({required String email, required String password}) async {
    final user = await repository.login(email, password);
    return user != null;
  }
}
