import 'package:erpapplication/presentation/bloc/auth_bloc.dart';
import 'package:erpapplication/presentation/ui/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'data/repository/auth_repostary.dart';
import 'domain/usecase/login_usecase.dart';

void main() {
  final authRepository = AuthRepository();
  final loginUseCase = LoginUseCase(authRepository);
  final authBloc = AuthBloc(loginUseCase);

  runApp(MyApp(authBloc: authBloc));
}

class MyApp extends StatelessWidget {
  final AuthBloc authBloc;

  const MyApp({
    super.key,
    required this.authBloc,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => authBloc,
      child: const MaterialApp(
        home: LoginPage(),
      ),
    );
  }
}
