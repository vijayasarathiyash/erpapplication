import 'package:hive/hive.dart';

import '../../domain/entities/user_entity.dart';
import '../model/user_model.dart';
import 'auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final Box<UserModel> box;

  AuthRepositoryImpl(this.box);

  @override
  Future<void> register(UserEntity user) async {
    await box.put(
      user.email,
      UserModel(email: user.email, password: user.password),
    );
  }

  @override
  Future<UserEntity?> login(String email, String password) async {
    final model = box.get(email);
    if (model != null && model.password == password) {
      return UserEntity(email: model.email, password: model.password);
    }
    return null;
  }
}
