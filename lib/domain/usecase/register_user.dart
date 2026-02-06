import '../../data/repository/auth_repository.dart';
import '../entities/user_entity.dart';

class RegisterUser {
  final AuthRepository repository;

  RegisterUser(this.repository);

  Future<void> call({required String email, required String password}) async {
    final user = UserEntity(email: email, password: password);
    await repository.register(user);
  }
}
