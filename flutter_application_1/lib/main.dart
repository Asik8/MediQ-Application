import 'package:flutter/material.dart';
import 'package:mediqu/pages/auth/login_page.dart';
import 'package:mediqu/pages/home_page.dart';  
import 'package:mediqu/pages/splash_page.dart';
import 'package:mediqu/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MediQ',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const SplashPage(),
      routes: {
        '/login': (context) => const LoginPage(),
        '/home': (context) => const HomePage(),
      },
    );
  }
}