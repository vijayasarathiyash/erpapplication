import '../../domain/entities/user_entity.dart';

abstract class AuthRepository {
  Future<void> register(UserEntity user);

  Future<UserEntity?> login(String email, String password);
}