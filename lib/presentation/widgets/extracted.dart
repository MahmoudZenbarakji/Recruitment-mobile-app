import 'package:flutter/material.dart';

class DrawerItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const DrawerItem(
      {required this.icon, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: onTap,
    );
  }
}

class EmployeeCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/logo.png', height: 60),
          SizedBox(height: 8),
          Text('Employee Name'),
          Text('Position'),
          ElevatedButton(onPressed: () {}, child: Text('View Profile')),
        ],
      ),
    );
  }
}

class CompanyCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/OIP (3).jfif', height: 60),
          SizedBox(height: 8),
          Text('Company Name'),
          Text('City, Country'),
          ElevatedButton(onPressed: () {}, child: Text('View Profile')),
        ],
      ),
    );
  }
}

class JobCard extends StatelessWidget {
  final String image;

  const JobCard(this.image);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Center(child: Image.asset(image, height: 60)),
    );
  }
}

class CustomDropdown extends StatelessWidget {
  final String value;
  final List<String> items;
  final ValueChanged<String?> onChanged;

  const CustomDropdown(
      {required this.value, required this.items, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: value,
      items:
          items.map((e) => DropdownMenuItem(child: Text(e), value: e)).toList(),
      onChanged: onChanged,
    );
  }
}
