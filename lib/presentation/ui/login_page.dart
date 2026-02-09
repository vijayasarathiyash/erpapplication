import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/auth_bloc.dart';
import '../state/auth_state.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();

  @override
  void dispose() {
    emailCtrl.dispose();
    passCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state.error != null) {
            ScaffoldMessenger.of(context)
              ..clearSnackBars()
              ..showSnackBar(
                SnackBar(content: Text(state.error!)),
              );
          }

          if (state.registrationSuccess) {
            ScaffoldMessenger.of(context)
              ..clearSnackBars()
              ..showSnackBar(
                const SnackBar(
                  content: Text("Registration successful ✅ Please login."),
                  behavior: SnackBarBehavior.floating,
                ),
              );
          }

          if (state.authenticated) {
            Navigator.pushReplacementNamed(context, '/home');
          }
        },

        builder: (context, state) {
          if (state.loading) {
            return const Center(child: CircularProgressIndicator());
          }

          return Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: emailCtrl,
                    decoration: const InputDecoration(
                      labelText: "Email",
                      hintText: "you@example.com",
                    ),
                    keyboardType: TextInputType.emailAddress,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (v) {
                      if (v == null || v.trim().isEmpty)
                        return "Email required";
                      final reg = RegExp(
                        r"^[\w\.\-]+@([\w\-]+\.)+[a-zA-Z]{2,}$",
                      );
                      if (!reg.hasMatch(v.trim())) return "Invalid email";
                      return null;
                    },
                    onChanged: (_) => context.read<AuthBloc>().clearError(),
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: passCtrl,
                    decoration: const InputDecoration(labelText: "Password"),
                    obscureText: true,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (v) {
                      if (v == null || v.isEmpty) return "Password required";
                      if (v.trim().length < 6) return "Min 6 characters";
                      return null;
                    },
                    onChanged: (_) => context.read<AuthBloc>().clearError(),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              context.read<AuthBloc>().login(
                                emailCtrl.text,
                                passCtrl.text,
                              );
                            }
                          },
                          child: const Text("Login"),
                        ),
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        context.read<AuthBloc>().register(
                          emailCtrl.text,
                          passCtrl.text,
                        );
                      }
                    },
                    child: const Text("Register"),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
