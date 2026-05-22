import 'package:flutter/material.dart';
import 'welcome.dart';   // Onboarding экран
import 'login.dart';     // Login экран
import 'register.dart';  // Register экран
import 'home.dart';      // Home экран

void main() {
  runApp(const KazakhLanguageApp());
}

class KazakhLanguageApp extends StatelessWidget {
  const KazakhLanguageApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Қазақ тілін үйрену',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // 🔹 Бағдарлама осы экраннан басталады
      initialRoute: '/',
      routes: {
        '/': (context) => const WelcomeScreen(),
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/home': (context) => const HomePage(),
      },
    );
  }
}
