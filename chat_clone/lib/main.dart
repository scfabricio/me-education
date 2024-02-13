import 'package:flutter/material.dart';
import './screens/welcome/welcome_screen.dart';
import './theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: lightThemeData(context),
      // darkTheme: darkThemeData(context),
      home: const WelcomeScreen(),
    );
  }
}