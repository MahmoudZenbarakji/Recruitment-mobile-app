import 'package:flutter/material.dart';

class MasterScreen extends StatelessWidget {
  MasterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Master Screen'),
        backgroundColor: const Color(0xFF03A84E),
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
              const SizedBox(height: 16),

              // Filters under slider
              _buildFilters(),
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

              const SizedBox(height: 10),

              // Employees Section
              const Text("Employees",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
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

  Widget _buildGridSection({
    required int itemCount,
    required Widget Function(BuildContext, int) itemBuilder,
  }) {
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
                  backgroundColor: const Color(0xFF03A84E),
                ),
                child: const Text('Apply Now'),
              ),
            ),
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
                  backgroundColor: const Color(0xFF03A84E),
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
                  backgroundColor: const Color(0xFF03A84E),
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
      padding: const EdgeInsets.only(top: 8, bottom: 0),
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

  Widget _buildFilters() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Wrap(
        spacing: 10,
        runSpacing: 10,
        children: const [
          _FilterInput(label: "Job Title"),
          _FilterInput(label: "City"),
          _FilterInput(label: "Category"),
        ],
      ),
    );
  }
}

class _FilterInput extends StatelessWidget {
  final String label;
  const _FilterInput({required this.label});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          labelText: label,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        ),
        items: _getDropdownItems(label).map((value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (value) {
          // Handle filter change if needed
        },
      ),
    );
  }

  List<String> _getDropdownItems(String label) {
    switch (label) {
      case "Job Title":
        return ["Developer", "Designer", "Manager"];
      case "City":
        return ["New York", "London", "Paris"];
      case "Category":
        return ["IT", "Marketing", "Finance"];
      default:
        return ["Option 1", "Option 2"];
    }
  }
}
