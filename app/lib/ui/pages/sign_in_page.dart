import 'package:app/bloc/cubit/login_cubit.dart';
import 'package:app/domain/entities/login.dart';
import 'package:app/injection.dart';
import 'package:app/ui/widgets/my_edit_text.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final formKey = GlobalKey<FormState>();
  FormState get form => formKey.currentState!;

  final cubit = getIt<LoginCubit>();
  final login = getIt<Login>();

  void showSnackbarError(String message) {
    final snackBar = SnackBar(
      content: Text(message),
      backgroundColor: Colors.red,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Form(
              key: formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: ListView(
                children: [
                  Column(
                    children: [
                      const Text('Mundo Enem'),
                      MyEditText(
                        label: 'Email',
                        inputType: TextInputType.emailAddress,
                        value: login.email.toString(),
                        onChanged: login.setEmail,
                        validator: (v) => login.email.validator(),
                      ),
                      const SizedBox(height: 18),
                      MyEditText(
                        label: 'Senha',
                        inputType: TextInputType.text,
                        value: login.password.toString(),
                        onChanged: login.setPassword,
                        validator: (v) => login.password.validator(),
                      ),
                      const SizedBox(height: 18),
                      TextButton(
                        onPressed: () {
                          final valid = form.validate();
                          if (valid) {
                            cubit.authentication(login);
                          } else {
                            showSnackbarError('Campos inválidos');
                          }
                        },
                        child: const Text('Entrar'),
                      ),
                      Expanded(
                        child: TextButton(
                          onPressed: () {},
                          child: const Row(
                            children: [
                              Icon(Icons.facebook),
                              Text('Entrar com Facebook'),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 18),
                      TextButton(
                        onPressed: () {},
                        child: const Row(
                          children: [
                            Icon(Icons.email),
                            Text('Entrar com Gmail'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
