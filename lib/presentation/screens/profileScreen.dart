import 'package:flutter/material.dart';
import 'package:smart_recuirtment/presentation/screens/companyScreen.dart';
import 'package:smart_recuirtment/presentation/screens/employees_screen.dart';
import 'package:smart_recuirtment/presentation/screens/jobs.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: Text('Profile'), backgroundColor: Color(0xFF03A84E)),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Applicant Details or Profile',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),

            /// Top profile card
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage(
                          'assets/images/logo.png'), // Replace with NetworkImage if needed
                    ),
                    SizedBox(height: 12),
                    Text(
                      'John Doe',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 6),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.location_on, size: 16, color: Colors.grey),
                        SizedBox(width: 4),
                        Text(
                          'Damascus, syria',
                          style: TextStyle(color: Colors.grey),
                        ),
                        Spacer(),
                        Icon(Icons.email, size: 16, color: Colors.grey),
                        SizedBox(width: 4),
                        Text(
                          'mahmoud@gmail.com',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),

            /// Details card
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    buildDetailRow('Job Type', 'Full-time'),
                    buildDetailRow('Work in the Major', 'Yes'),
                    buildDetailRow('Offered Salary', '\$80,000/year'),
                    buildDetailRow('Experience', '5 years'),
                    buildDetailRow('Gender', 'Male'),
                    buildDetailRow('Nationality', 'American'),
                    buildDetailRow('Skills', 'Flutter, Dart, Firebase'),
                    buildDetailRow('Level', 'Senior'),
                    buildDetailRow('Views', '120'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDetailRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              title,
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
          Expanded(
            flex: 6,
            child: Text(value),
          ),
        ],
      ),
    );
  }
}

// Dummy Screens for Navigation
