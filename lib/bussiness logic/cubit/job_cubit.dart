import 'package:bloc/bloc.dart';
import 'package:smart_recuirtment/data/model/job.dart';
import 'package:smart_recuirtment/data/repo/job_Repository.dart';
import 'package:meta/meta.dart';

part 'job_state.dart';

class JobCubit extends Cubit<JobState> {
  final JobRepository jobRepository;

  JobCubit(this.jobRepository) : super(JobInitial());

  List<Job> jobs = [];

  void getAllJobs() {
    jobRepository.getAllJobs().then((jobList) {
      emit(JobLoaded(jobList.cast<Job>()));
      jobs = jobList.cast<Job>();
    });
  }
}
