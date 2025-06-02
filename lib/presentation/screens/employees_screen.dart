import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smart_recuirtment/presentation/screens/Details_screens/employeeDetail_screen.dart';

class EmployeeScreen extends StatefulWidget {
  @override
  _EmployeeScreenState createState() => _EmployeeScreenState();
}

class _EmployeeScreenState extends State<EmployeeScreen> {
  int _currentCarousel = 0;

  double _sliderValue = 50;
  String _selectedSalary = 'Any';
  String _selectedCity = 'Any';
  String _selectedWorkType = 'Any';

  final List<String> banners = [
    'https://via.placeholder.com/400x150',
    'https://via.placeholder.com/400x150?text=Second',
    'https://via.placeholder.com/400x150?text=Third',
  ];

  final List<String> salaryOptions = [
    'Any',
    '< \$1000',
    '\$1000-\$2000',
    '>\$2000'
  ];
  final List<String> cityOptions = [
    'Any',
    'New York',
    'Los Angeles',
    'Chicago'
  ];
  final List<String> workTypeOptions = [
    'Any',
    'Full Time',
    'Part Time',
    'Remotely'
  ];

  List<Map<String, String>> employees = [
    {
      'name': 'John Doe',
      'image':
          'https://cdn-images-1.medium.com/max/1200/1*VVZm2i7lk8qNMOmutj5lDw.jpeg',
      'position': 'frontend'
    },
    {
      'name': 'Jane Smith',
      'image':
          'https://cdn-images-1.medium.com/max/1200/1*VVZm2i7lk8qNMOmutj5lDw.jpeg',
      'position': 'frontend'
    },
    {
      'name': 'Alex Johnson',
      'image':
          'https://cdn-images-1.medium.com/max/1200/1*VVZm2i7lk8qNMOmutj5lDw.jpeg',
      'position': 'frontend'
    },
    {
      'name': 'Emily Davis',
      'image':
          'https://cdn-images-1.medium.com/max/1200/1*VVZm2i7lk8qNMOmutj5lDw.jpeg',
      'position': 'frontend'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Employees')),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            // Slider
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //may put a slider
                _buildCarousel()
              ],
            ),
            SizedBox(height: 10),

            // Filters

            SizedBox(height: 20),

            // Grid of Employees
            Expanded(
              child: GridView.builder(
                itemCount: employees.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 220,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  final employee = employees[index];
                  return Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.network(employee['image']!,
                            height: 100, width: 100),
                        SizedBox(height: 8),
                        Text(employee['name']!,
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        SizedBox(height: 8),
                        Text(employee['position']!,
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EmployeeDetailScreen(
                                    name: employee['name']!,
                                    position: employee['position']),
                              ),
                            );
                          },
                          child: Text('View'),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCarousel() {
    return Column(
      children: [
        CarouselSlider(
          items: banners
              .map((url) => ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset('assets/images/4.jpg',
                        errorBuilder: (context, error, stackTrace) =>
                            const Icon(Icons.error),
                        fit: BoxFit.cover,
                        width: double.infinity),
                  ))
              .toList(),
          options: CarouselOptions(
              height: 180,
              autoPlay: true,
              onPageChanged: (index, reason) {
                setState(() => _currentCarousel = index);
              }),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: banners.map((url) {
            int index = banners.indexOf(url);
            return Container(
              width: 10.0,
              height: 10.0,
              margin: EdgeInsets.symmetric(horizontal: 4.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _currentCarousel == index ? Colors.blue : Colors.grey,
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildDropdown(String label, List<String> options, String selected,
      ValueChanged<String?> onChanged) {
    return Column(
      children: [
        Text(label),
        DropdownButton<String>(
          value: selected,
          items: options.map((opt) {
            return DropdownMenuItem(
              value: opt,
              child: Text(opt),
            );
          }).toList(),
          onChanged: onChanged,
        ),
      ],
    );
  }
}
