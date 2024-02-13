import 'package:flutter/material.dart';
import 'package:app/ui/pages/home_page.dart';
import 'package:app/ui/pages/login_page.dart';
import 'package:app/ui/pages/sign_in_page.dart';
import 'package:app/ui/pages/sign_up_page.dart';

Map<String, Widget Function(BuildContext)> myRoutes = {
  '/login': (context) => LoginPage(),
  '/signin': (context) => SignInPage(),
  '/signup': (context) => SignUpPage(),
  '/home':(context) => const HomePage(),
};