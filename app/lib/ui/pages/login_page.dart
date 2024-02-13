import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final buttonStyle = ElevatedButton.styleFrom(
    textStyle: const TextStyle(fontSize: 18),
    padding: const EdgeInsets.all(18),
  );

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(color: Colors.red),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Mundo Enem',
                style: TextStyle(color: Colors.white, fontSize: 45.0)),
            const SizedBox(height: 120),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/signup');
                },
                child: const Text(
                  'Cadastre-se',
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 18),
            const Text(
              'Você já possui uma conta?',
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 18),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: FilledButton(
                style: FilledButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shape: BeveledRectangleBorder(
                    side: const BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(2.0),
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/signin');
                },
                child: const Text('Entrar'),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
