import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_recuirtment/bussiness%20logic/bloc/employee_event.dart';
import 'package:smart_recuirtment/bussiness%20logic/cubit/employeeCubit.dart';
import 'package:smart_recuirtment/data/api/employeeService.dart';
import 'package:smart_recuirtment/data/repo/employeeRepository.dart';
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

class SmartRecruitmentApp extends StatefulWidget {
  const SmartRecruitmentApp({super.key});

  @override
  State<SmartRecruitmentApp> createState() => _SmartRecruitmentAppState();
}

class _SmartRecruitmentAppState extends State<SmartRecruitmentApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      title: 'Smart Recruitment',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF03A84E),
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF03A84E)),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF03A84E),
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
      home: const SplashScreen(),
    );
  }
}

class HomeScreenWithCustomNavBar extends StatefulWidget {
  const HomeScreenWithCustomNavBar({super.key});

  @override
  State<HomeScreenWithCustomNavBar> createState() =>
      _HomeScreenWithCustomNavBarState();
}

class _HomeScreenWithCustomNavBarState
    extends State<HomeScreenWithCustomNavBar> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    JobListingScreen(),
    CompanyScreen(),
    MasterScreen(),
    BlocProvider(
      create: (context) =>
          EmployeeBloc(EmployeeRepository(EmployeeApiService(Dio())))
            ..add(LoadEmployees()),
      child: EmployeeScreen(),
    ),
    ProfileScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: _screens[_selectedIndex],
      floatingActionButton: FloatingActionButton(
        elevation: 10,
        onPressed: () => _onItemTapped(2),
        backgroundColor: Colors.white,
        child: Icon(
          Icons.dashboard,
          color: _selectedIndex == 2 ? Color(0xFF03A84E) : Colors.grey,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8.0,
        color: const Color(0xFF03A84E),
        child: SizedBox(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildTab(icon: Icons.work, index: 0, label: 'Jobs'),
              _buildTab(icon: Icons.business, index: 1, label: 'Companies'),
              const SizedBox(width: 40), // space for FAB notch
              _buildTab(icon: Icons.people, index: 3, label: 'Employees'),
              _buildTab(icon: Icons.person, index: 4, label: 'Profile'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTab(
      {required IconData icon, required int index, required String label}) {
    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: _selectedIndex == index ? Colors.white : Colors.white70,
          ),
          Text(
            label,
            style: TextStyle(
              color: _selectedIndex == index ? Colors.white : Colors.white70,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
