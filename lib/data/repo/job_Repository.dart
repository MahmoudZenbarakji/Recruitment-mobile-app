import 'package:smart_recuirtment/data/api/jobServices.dart';
import 'package:smart_recuirtment/data/model/Job.dart';

class JobRepository {
  final JobService jobService;

  JobRepository(this.jobService);

  Future<List<Job>> getAllJobs() async {
    final jobs = await jobService.getAllJobs();
    return jobs.map((job) => Job.fromJson(job)).toList();
  }
}
