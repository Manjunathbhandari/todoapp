// @dart = 2.12
// ignore_for_file: import_of_legacy_library_into_null_safe
// @dart = 2.12

import 'package:flutter/material.dart';
import 'package:todoapp/utils/routes.dart';
import 'package:todoapp/widget/theme.dart';
import 'screens/dashboard.dart';
import 'screens/forgotpasswordpage.dart';
import 'screens/homepage.dart';
import 'screens/loginpage.dart';
import 'screens/registerpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "TODO App",
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: ThemeData(
        primaryColor: const Color.fromARGB(255, 80, 195, 202),
      ),
      darkTheme: MyTheme.darkTheme(context),
      initialRoute: '/home',
      routes: {
        '/': (context) => const HomePage(),
        MyRoutes.homeRoute: (context) => const HomePage(),
        MyRoutes.loginRoute: (context) => const LoginPage(),
        MyRoutes.registerRoute: (context) => const RegisterPage(),
        MyRoutes.forgotPasswordRoute: (context) => const ForgotPasswordPage(),
        MyRoutes.dashboardRoute: (context) => DashboardPage(
              name: '',
            ),
      },
    );
  }
}
