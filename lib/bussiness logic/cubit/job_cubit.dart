import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_recuirtment/data/repo/job_Repository.dart';
import 'job_state.dart';

class JobCubit extends Cubit<JobState> {
  final JobRepository jobRepository;

  JobCubit(this.jobRepository) : super(JobInitial());

  void fetchJobs() async {
    try {
      emit(JobLoading());
      final jobs = await jobRepository.getAllJobs();
      emit(JobLoaded(jobs));
    } catch (e) {
      emit(JobError(e.toString()));
    }
  }
}
