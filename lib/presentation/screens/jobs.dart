import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_recuirtment/bussiness%20logic/cubit/job_cubit.dart';
import 'package:smart_recuirtment/bussiness%20logic/cubit/job_state.dart';

import 'package:smart_recuirtment/data/model/Job.dart';
import 'package:smart_recuirtment/data/repo/job_Repository.dart';

class JobListingScreen extends StatelessWidget {
  const JobListingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => JobCubit(JobRepository())..fetchJobs(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Job Listings'),
          backgroundColor: const Color(0xFF03A84E),
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
                        child: Image.asset('assets/images/3.jpg',
                            fit: BoxFit.cover),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 24),

                // BlocBuilder to build job cards based on state
                BlocBuilder<JobCubit, JobState>(
                  builder: (context, state) {
                    if (state is JobLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is JobLoaded) {
                      final List<Job> jobs = state.jobs;
                      return GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: jobs.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
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
                                  // Placeholder image
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.asset(
                                      'assets/images/3.jpg',
                                      height: 100,
                                      width: double.infinity,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    job.title,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Text(
                                    job.description,
                                    style: const TextStyle(fontSize: 13),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    'Experience: ${job.experiencesYear} yrs',
                                    style: const TextStyle(fontSize: 13),
                                  ),
                                  const Spacer(),
                                  SizedBox(
                                    width: double.infinity,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        // handle apply
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            const Color(0xFF03A84E),
                                      ),
                                      child: const Text('Apply Now'),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    } else if (state is JobError) {
                      return Center(child: Text(state.message));
                    } else {
                      return const SizedBox();
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
