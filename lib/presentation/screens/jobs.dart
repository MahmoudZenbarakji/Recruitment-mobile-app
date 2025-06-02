import 'package:flutter/material.dart';
import 'package:smart_recuirtment/presentation/screens/companyScreen.dart';
import 'package:smart_recuirtment/presentation/screens/employees_screen.dart';
import 'package:smart_recuirtment/presentation/screens/profileScreen.dart';

class JobListingScreen extends StatelessWidget {
  const JobListingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final jobs = List.generate(
        6,
        (index) => {
              'image': 'assets/images/3.jpg',
              'company': 'Company ${index + 1}',
              'position': 'Position ${index + 1}',
              'salary': '\$${3000 + index * 500}/month',
            });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Job Listings'),
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
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Slider
              SizedBox(
                height: 200,
                child: PageView(
                  children: List.generate(
                    3,
                    (index) => ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child:
                          Image.asset('assets/images/3.jpg', fit: BoxFit.cover),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              // Job Cards
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: jobs.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.65,
                ),
                itemBuilder: (context, index) {
                  final job = jobs[index];
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              job['image']!,
                              height: 100,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(job['company']!,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16)),
                          Text(job['position']!,
                              style: const TextStyle(fontSize: 14)),
                          const SizedBox(height: 4),
                          Text('Salary: ${job['salary']}',
                              style: const TextStyle(
                                fontSize: 13,
                              )),
                          const Spacer(),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFF03A84E),
                              ),
                              child: const Text('Apply Now'),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
