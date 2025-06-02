import 'package:flutter/material.dart';
import 'package:smart_recuirtment/data/model/Job.dart';
import 'package:smart_recuirtment/presentation/screens/auth/login.dart';
import 'package:smart_recuirtment/presentation/screens/companyScreen.dart';
import 'package:smart_recuirtment/presentation/screens/employees_screen.dart';
import 'package:smart_recuirtment/presentation/screens/jobs.dart';
import 'package:smart_recuirtment/presentation/screens/masterPage.dart';
import 'package:smart_recuirtment/presentation/screens/profileScreen.dart';
import 'package:smart_recuirtment/presentation/screens/splashScreen.dart';

void main() {
  runApp(SmartRecruitmentApp());
}

class SmartRecruitmentApp extends StatelessWidget {
  SmartRecruitmentApp({super.key});
  // for Jobs

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      title: 'Smart Recruitment',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF03A84E),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF03A84E),
          // brightness: Brightness.light,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF03A84E),
          //    foregroundColor: Colors.white,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              // backgroundColor: const Color(0xFF03A84E),

              //backgroundColor: cardColor,
              //foregroundColor: Colors.black,
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
      home: SplashScreen(),
    );
  }
}
