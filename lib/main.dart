import 'package:flutter/material.dart';
import 'package:smart_recuirtment/presentation/screens/auth/login.dart';
import 'package:smart_recuirtment/presentation/screens/companyScreen.dart';

void main() {
  runApp(const SmartRecruitmentApp());
}

class SmartRecruitmentApp extends StatelessWidget {
  const SmartRecruitmentApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart Recruitment',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF03A84E),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF03A84E),
          brightness: Brightness.light,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF03A84E),
          foregroundColor: Colors.white,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF03A84E),
          ),
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Color(0xFF03A84E),
        ),
        inputDecorationTheme: InputDecorationTheme(
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xFF03A84E)),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      home: const AuthApp(),
    );
  }
}
