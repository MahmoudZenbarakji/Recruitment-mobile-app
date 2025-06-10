//part of 'job_cubit.dart';
part of 'job_cubit.dart';

@immutable
abstract class JobState {}

class JobInitial extends JobState {}

class JobLoaded extends JobState {
  final List<Job> jobs;

  JobLoaded(this.jobs);
}
