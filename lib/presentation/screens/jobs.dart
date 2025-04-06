import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smart_recuirtment/bussiness%20logic/cubit/pagination_cubit.dart';
import 'package:smart_recuirtment/data/model/Job.dart';
import 'package:smart_recuirtment/data/repo/jobRepository.dart';

class JobsScreen extends StatefulWidget {
  @override
  _JobsScreenState createState() => _JobsScreenState();
}

class _JobsScreenState extends State<JobsScreen> {
  int _currentCarousel = 0;

  final List<String> banners = [
    'https://via.placeholder.com/400x150',
    'https://via.placeholder.com/400x150?text=Second',
    'https://via.placeholder.com/400x150?text=Third',
  ];

  final List<String> filters = ['All', 'Remote', 'Full-time', 'Part-time'];
  String selectedFilter = 'All';

  final List<Map<String, String>> jobs = List.generate(
    10,
    (index) => {
      "title": "Job Title $index",
      "location": "City $index",
      "salary": "\$${2000 + index * 300}",
    },
  );
  /*  
  for pagination 
  final jobCubit = PaginationCubit<Job>(
    (page, limit) => jobRepository.getJobs(page: page, limit: limit),
  );*/

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Jobs')),
        body: SingleChildScrollView(
          child: Column(
            children: [
              _buildCarousel(),
              SizedBox(height: 16),
              _buildFilters(),
              SizedBox(height: 8),
              _buildJobsGrid(),
            ],
          ),
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
                    child: Image.network(
                        'https://th.bing.com/th/id/OIP.hRPPCTMK1M_gGEpBvux89wHaFO?rs=1&pid=ImgDetMain',
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
              width: 8.0,
              height: 8.0,
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

  Widget _buildFilters() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: filters.map((filter) {
          final isSelected = filter == selectedFilter;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: ChoiceChip(
              label: Text(filter),
              selected: isSelected,
              onSelected: (_) {
                setState(() => selectedFilter = filter);
              },
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildJobsGrid() {
    return Padding(
      padding: EdgeInsets.all(8),
      child: GridView.builder(
        itemCount: jobs.length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.75,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (context, index) {
          final job = jobs[index];
          return Card(
            elevation: 3,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(job["title"]!,
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
                  Text(job["location"]!),
                  Spacer(),
                  Text(job["salary"]!, style: TextStyle(color: Colors.green)),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
