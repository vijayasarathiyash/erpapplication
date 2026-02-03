import 'package:dio/dio.dart';
import '../model/dio_client.dart';
import '../network/login_response.dart';

class AuthRepository {
  Future<LoginResponse> login(
      String email,
      String password,
      ) async {
    final Response response = await DioClient.dio.post(
      "/auth/login",
      data: {
        "email": email,
        "password": password,
      },
    );
    return LoginResponse.fromJson(response.data);
  }
}