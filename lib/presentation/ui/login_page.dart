import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/auth_bloc.dart';
import '../state/auth_state.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: Center(
        child: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            if (state.loading) {
              return const CircularProgressIndicator();
            }

            return ElevatedButton(
              onPressed: () {
                context.read<AuthBloc>().login(
                  "test@mail.com",
                  "123456",
                );
              },
              child: const Text("Login"),
            );
          },
        ),
      ),
    );
  }
}
