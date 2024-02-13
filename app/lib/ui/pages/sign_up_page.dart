import 'package:app/bloc/cubit/login_cubit.dart';
import 'package:app/domain/entities/register.dart';
import 'package:app/errors/login_erros.dart';
import 'package:app/injection.dart';
import 'package:app/ui/widgets/my_edit_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final formKey = GlobalKey<FormState>();
  FormState get form => formKey.currentState!;

  final cubit = getIt<LoginCubit>();
  Register register = getIt<Register>();

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
      appBar: AppBar(
        title: const Text('Cadastre-se'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: BlocConsumer(
          bloc: cubit,
          listener: (context, state) {
            if (state is LoginError && state.error is GenericLoginFailure) {
              showSnackbarError('Problema na api. Tente novamente mais tarde');
            } else if (state is SignUpSuccess) {
              // Navegar para o login
            }
          },
          builder: (context, state) {
            bool isLoading = state is LoginLoading;

            return Form(
              key: formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: ListView(
                children: [
                  Column(
                    children: [
                      const SizedBox(height: 18),
                      MyEditText(
                        label: 'Nome',
                        inputType: TextInputType.name,
                        value: register.name.toString(),
                        onChanged: register.setName,
                        validator: (v) => register.name.validator(),
                      ),
                      const SizedBox(height: 18),
                      MyEditText(
                        label: 'Email',
                        inputType: TextInputType.emailAddress,
                        value: register.email.toString(),
                        onChanged: register.setEmail,
                        validator: (v) => register.email.validator(),
                      ),
                      const SizedBox(height: 18),
                      MyEditText(
                        label: 'Senha',
                        inputType: TextInputType.visiblePassword,
                        value: register.password.toString(),
                        onChanged: register.setPassword,
                        validator: (v) => register.password.validator(),
                      ),
                      const SizedBox(height: 18),
                      MyEditText(
                        label: 'Confirme a senha',
                        inputType: TextInputType.visiblePassword,
                        value: register.confirmPassword.toString(),
                        onChanged: register.setConfirmPassword,
                        validator: (v) {
                          String? r = register.confirmPassword.validator();
                          if (r == null &&
                              register.password.toString() !=
                                  register.confirmPassword.toString()) {
                            r = 'As senhas devem ser iguais';
                          }
                          return r;
                        },
                      ),
                      const SizedBox(height: 18),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            shape: BeveledRectangleBorder(
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                          onPressed: isLoading
                              ? () {}
                              : () {
                                  final valid = form.validate();
                                  if (valid) {
                                    cubit.register(register);
                                  } else {
                                    showSnackbarError('Campos inválidos');
                                  }
                                },
                          child: isLoading
                              ? SizedBox(
                                height: 18.0,
                                width: 18.0,
                                child: CircularProgressIndicator(
                                  color: Colors.red[50],
                                ),
                              )
                              : const Text(
                                  'Cadastrar',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
