import 'package:flutter/material.dart';

class CompanyScreen extends StatelessWidget {
  const CompanyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: Text('company'), backgroundColor: Color(0xFF03A84E)),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: _buildSlider()),
          SliverToBoxAdapter(child: _buildFilters()),
          SliverPadding(
            padding: const EdgeInsets.all(8),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (context, index) => _buildCompanyCard(),
                childCount: 4,
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
          _FilterInput(label: "Salary"),
        ],
      ),
    );
  }

  Widget _buildCompanyCard() {
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
              child: const Icon(Icons.business, size: 30),
            ),
            const SizedBox(height: 8),
            const Text("Company Name",
                style: TextStyle(fontWeight: FontWeight.bold)),
            const Text(
              "1-Short description.vskdvjldvljds..",
              maxLines: 2,
            ),
            const Spacer(),
            const Text("City, Country", style: TextStyle(color: Colors.grey)),
          ],
        ),
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
          // Handle value selection here if needed
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
      case "Salary":
        return ["< \$2000", "\$2000-\$5000", "> \$5000"];
      case "Skills":
        return ["Flutter", "React", "Node.js"];
      case "Job Type":
        return ["Full-time", "Part-time", "Remote"];
      default:
        return ["Option 1", "Option 2"];
    }
  }
}
