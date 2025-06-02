import 'package:flutter/material.dart';
import 'package:smart_recuirtment/presentation/screens/companyScreen.dart';
import 'package:smart_recuirtment/presentation/screens/employees_screen.dart';
import 'package:smart_recuirtment/presentation/screens/jobs.dart';
import 'package:smart_recuirtment/presentation/screens/profileScreen.dart';

class MasterScreen extends StatelessWidget {
  MasterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Master Screen'),
        backgroundColor: Color(0xFF03A84E),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/images/3.jpg'),
              ),
              accountName: const Text("John Doe"),
              accountEmail: null,
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text("Profile"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => ProfileScreen()),
                );
                // Navigate to profile screen
              },
            ),
            ListTile(
              leading: const Icon(Icons.work),
              title: const Text("Jobs"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => JobListingScreen()),
                );
                // Navigate to jobs screen
              },
            ),
            ListTile(
              leading: const Icon(Icons.apartment),
              title: const Text("Companies"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => CompanyScreen()),
                );
                // Navigate to companies screen
              },
            ),
            ListTile(
              leading: const Icon(Icons.group),
              title: const Text("Employees"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => EmployeeScreen()),
                );
                // Navigate to employees screen
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image Slider
              SizedBox(
                height: 200,
                child: PageView.builder(
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        'assets/images/5.jpg',
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 24),

              // Jobs Section
              const Text("Jobs",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              const SizedBox(height: 16),
              _buildGridSection(
                itemCount: 4,
                itemBuilder: (context, index) => _buildJobCard(context, index),
              ),
              _buildPagination(),

              const SizedBox(height: 32),

              // Companies Section
              const Text("Companies",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              const SizedBox(height: 16),
              _buildGridSection(
                itemCount: 4,
                itemBuilder: (context, index) =>
                    _buildCompanyCard(context, index),
              ),
              _buildPagination(),

              const SizedBox(height: 32),

              // Employees Section
              const Text("Employees",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              const SizedBox(height: 16),
              _buildGridSection(
                itemCount: 4,
                itemBuilder: (context, index) =>
                    _buildEmployeeCard(context, index),
              ),
              _buildPagination(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGridSection(
      {required int itemCount,
      required Widget Function(BuildContext, int) itemBuilder}) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 14,
        crossAxisSpacing: 16,
        childAspectRatio: 0.68,
      ),
      itemCount: itemCount,
      itemBuilder: itemBuilder,
    );
  }

  Widget _buildJobCard(BuildContext context, int index) {
    final jobs = [
      {
        'image': 'assets/images/2.jpg',
        'title': 'Software Engineer',
        'location': 'USA, New York'
      },
      {
        'image': 'assets/images/2.jpg',
        'title': 'UI/UX Designer',
        'location': 'Canada, Toronto'
      },
      {
        'image': 'assets/images/2.jpg',
        'title': 'Data Analyst',
        'location': 'UK, London'
      },
      {
        'image': 'assets/images/2.jpg',
        'title': 'Product Manager',
        'location': 'Germany, Munich'
      },
    ];

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: Image.asset(jobs[index]['image']!, fit: BoxFit.contain),
            ),
            const SizedBox(height: 8),
            Text(jobs[index]['title']!,
                style: const TextStyle(fontWeight: FontWeight.bold)),
            Text(jobs[index]['location']!),
            const SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF03A84E),
                ),
                child: const Text('Apply Now'),
              ),
            ),

            /*ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey,
                foregroundColor: Colors.black,
              ),
              onPressed: () {},
              child: const Text("View Details"),
            ),*/
          ],
        ),
      ),
    );
  }

  Widget _buildCompanyCard(BuildContext context, int index) {
    final companies = [
      {
        'image': 'assets/images/2.jpg',
        'name': 'Tech Corp',
        'location': 'Germany, Berlin'
      },
      {
        'image': 'assets/images/2.jpg',
        'name': 'InnoSoft',
        'location': 'USA, San Francisco'
      },
      {
        'image': 'assets/images/2.jpg',
        'name': 'FutureTech',
        'location': 'Japan, Tokyo'
      },
      {
        'image': 'assets/images/2.jpg',
        'name': 'Creative Labs',
        'location': 'France, Paris'
      },
    ];

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child:
                  Image.asset(companies[index]['image']!, fit: BoxFit.contain),
            ),
            const SizedBox(height: 8),
            Text(companies[index]['name']!,
                style: const TextStyle(fontWeight: FontWeight.bold)),
            Text(companies[index]['location']!),
            const SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF03A84E),
                ),
                child: const Text('Apply Now'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmployeeCard(BuildContext context, int index) {
    final employees = [
      {'image': 'assets/images/2.jpg', 'name': 'Alice Johnson'},
      {'image': 'assets/images/2.jpg', 'name': 'Bob Smith'},
      {'image': 'assets/images/2.jpg', 'name': 'Carol Davis'},
      {'image': 'assets/images/2.jpg', 'name': 'David Lee'},
    ];

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child:
                  Image.asset(employees[index]['image']!, fit: BoxFit.contain),
            ),
            const SizedBox(height: 8),
            Text(employees[index]['name']!,
                style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF03A84E),
                ),
                child: const Text('Apply Now'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPagination() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(5, (index) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 4),
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(4),
            ),
            alignment: Alignment.center,
            child: Text("${index + 1}"),
          );
        }),
      ),
    );
  }
}
