import 'package:erpapplication/presentation/bloc/auth_bloc.dart';
import 'package:erpapplication/presentation/ui/home_page.dart';
import 'package:erpapplication/presentation/ui/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'data/model/user_model.dart';
import 'data/repository/auth_repositoryImpl.dart';
import 'domain/usecase/login_usecase.dart';
import 'domain/usecase/register_user.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(UserModelAdapter());

  final userBox = await Hive.openBox<UserModel>('users');

  final authRepository = AuthRepositoryImpl(userBox);
  final loginUser = LoginUser(authRepository);
  final registerUser = RegisterUser(authRepository);

  final authBloc = AuthBloc(loginUser: loginUser, registerUser: registerUser);

  runApp(MyApp(authBloc: authBloc));
}

class MyApp extends StatelessWidget {
  final AuthBloc authBloc;

  const MyApp({super.key, required this.authBloc});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthBloc>(
      create: (_) => authBloc,
      child: MaterialApp(
          title: 'Auth Demo',
          home: const LoginPage(),
          routes: { '/home': (_) => const HomePage()}
      ),
    );
  }
}
