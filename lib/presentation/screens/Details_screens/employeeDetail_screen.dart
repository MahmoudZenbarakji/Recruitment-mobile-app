import 'package:flutter/material.dart';

class EmployeeDetailScreen extends StatelessWidget {
  final String name;

  const EmployeeDetailScreen({Key? key, required this.name, String? position})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('$name\'s Details')),
      body: Center(
        child: Text('Details for and his position is  $name',
            style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
