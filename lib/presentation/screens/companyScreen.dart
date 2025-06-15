import 'package:flutter/material.dart';

class CompanyScreen extends StatelessWidget {
  const CompanyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Define different data for each company
    final companies = [
      {
        'name': 'TechCorp',
        'description': 'Innovative solutions for modern problems.',
        'location': 'New York, USA',
        'logo': Icons.business_center,
      },
      {
        'name': 'Designify',
        'description': 'Creative designs and branding.',
        'location': 'Paris, France',
        'logo': Icons.palette,
      },
      {
        'name': 'FinancePros',
        'description': 'Professional financial services.',
        'location': 'London, UK',
        'logo': Icons.attach_money,
      },
      {
        'name': 'HealthNet',
        'description': 'Revolutionizing healthcare tech.',
        'location': 'Berlin, Germany',
        'logo': Icons.health_and_safety,
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Company'),
        backgroundColor: const Color(0xFF03A84E),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: _buildSlider()),

          // Add heading "Companies"
          SliverToBoxAdapter(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
              child: Text(
                "Companies",
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          // Grid of companies
          SliverPadding(
            padding: const EdgeInsets.all(8),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (context, index) => _buildCompanyCard(companies[index]),
                childCount: companies.length,
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 3 / 3.5,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSlider() {
    return SizedBox(
      height: 160,
      child: PageView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.blueGrey.shade300,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Text(
                "Slide ${index + 1}",
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildCompanyCard(Map<String, dynamic> company) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Company Logo
            Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.grey.shade300,
              ),
              child: Icon(company['logo'], size: 30),
            ),
            const SizedBox(height: 8),
            Text(company['name'],
                style: const TextStyle(fontWeight: FontWeight.bold)),
            Text(
              company['description'],
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const Spacer(),
            Text(company['location'],
                style: const TextStyle(color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}
