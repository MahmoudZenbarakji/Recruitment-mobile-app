import 'package:flutter/material.dart';

class JobDetailsScreen extends StatelessWidget {
  const JobDetailsScreen({super.key, required Map<String, String> job});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Job Details')),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isWide = constraints.maxWidth > 800;

          if (isWide) {
            // Web/tablet layout
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(flex: 2, child: _buildMainContent()),
                      const SizedBox(width: 24),
                      Expanded(flex: 1, child: _buildSidebar(context)),
                    ],
                  ),
                ),
              ),
            );
          } else {
            // Mobile layout
            return CustomScrollView(
              slivers: [
                SliverPadding(
                  padding: const EdgeInsets.all(16),
                  sliver: SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        _buildMainContent(),
                        const SizedBox(height: 24),
                        _buildSidebar(context),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }

  Widget _buildMainContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _jobHeader(),
        const SizedBox(height: 24),
        _jobOverview(),
        const SizedBox(height: 32),
        jobSectionTitle('Description'),
        jobParagraph('It is a long established fact...'),
        jobSectionTitle('Responsibilities'),
        jobBulletList([
          'Developing custom themes (WordPress.org & ThemeForest Standards)',
          'Creating reactive website designs',
          'Working under strict deadlines',
          'Develop page speed optimized themes',
        ]),
        jobSectionTitle('Requirements'),
        jobBulletList([
          'Approved theme/s on ThemeForest',
          'Knowledge of WordPress Standards',
          'OOP PHP, HTML, CSS, JS',
          'Debug and fix bugs',
        ]),
        jobSectionTitle('Educational Requirements'),
        jobParagraph('It doesn’t matter where you went to college...'),
        jobSectionTitle('Working Hours'),
        jobBulletList(
            ['8:00 AM - 5:00 PM', 'Weekly: 5 days', 'Weekend: Sat-Sun']),
        jobSectionTitle('Benefits'),
        jobBulletList([
          'Flat organization',
          'Provident fund',
          'Performance bonus',
          'Unlimited snacks & tea',
        ]),
        jobSectionTitle('Statement'),
        jobParagraph('We are committed to creating the happiest workplace...'),
      ],
    );
  }

  Widget _buildSidebar(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Card(
          elevation: 3,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('Job Summary',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Divider(),
                _SummaryRow(label: 'Published on:', value: '25 July, 2022'),
                _SummaryRow(label: 'Vacancy:', value: '4'),
                _SummaryRow(label: 'Employment Status:', value: 'Full-time'),
                _SummaryRow(label: 'Experience:', value: '2 to 3 year(s)'),
                _SummaryRow(label: 'Gender:', value: 'Both'),
                _SummaryRow(label: 'Age:', value: '25 to 32 year(s)'),
                _SummaryRow(label: 'Job Location:', value: 'New York, USA'),
                _SummaryRow(label: 'Salary:', value: '\$5000 /monthly'),
                _SummaryRow(label: 'Deadline:', value: '31 August, 2022'),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton.icon(
            icon: const Icon(Icons.send),
            label: const Text('Apply Now'),
            onPressed: () {},
          ),
        ),
      ],
    );
  }

  Widget _jobHeader() {
    return Container(
      decoration: BoxDecoration(
        image: const DecorationImage(
          image: AssetImage("assets/img/photos/bg2.jpg"),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(Colors.black45, BlendMode.darken),
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(24),
      alignment: Alignment.center,
      child: Column(
        children: const [
          Text('Job Details',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          Text('Home // Job Details', style: TextStyle(color: Colors.white70)),
        ],
      ),
    );
  }

  Widget _jobOverview() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Company Image
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            'assets/img/companies/10.jpg',
            width: 100,
            height: 100,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(width: 16),
        // Job Title and Details
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text('Senior Web Developer',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              SizedBox(height: 4),
              Text('Obelus Concepts Ltd.',
                  style: TextStyle(color: Colors.grey)),
              SizedBox(height: 8),
              Row(children: [
                Icon(Icons.location_on, size: 16),
                SizedBox(width: 4),
                Text('New York, USA'),
              ]),
              SizedBox(height: 4),
              Row(children: [
                Icon(Icons.phone, size: 16),
                SizedBox(width: 4),
                Text('+88 456 796 457'),
              ]),
            ],
          ),
        ),
      ],
    );
  }

  Widget jobSectionTitle(String title) => Padding(
        padding: const EdgeInsets.only(top: 24, bottom: 8),
        child: Text(title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      );

  Widget jobParagraph(String text) => Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: Text(text, style: const TextStyle(fontSize: 16, height: 1.5)),
      );

  Widget jobBulletList(List<String> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: items
          .map((item) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('• ', style: TextStyle(fontSize: 16)),
                    Expanded(
                        child:
                            Text(item, style: const TextStyle(fontSize: 16))),
                  ],
                ),
              ))
          .toList(),
    );
  }
}

class _SummaryRow extends StatelessWidget {
  final String label;
  final String value;

  const _SummaryRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              flex: 2,
              child: Text(label,
                  style: const TextStyle(fontWeight: FontWeight.w600))),
          Expanded(flex: 3, child: Text(value)),
        ],
      ),
    );
  }
}
