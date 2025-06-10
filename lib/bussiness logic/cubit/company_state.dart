part of 'companyCubit.dart';

@immutable
abstract class CompanyState {}

class CompanyInitial extends CompanyState {}

class CompanyLoaded extends CompanyState {
  final List<Company> companies;

  CompanyLoaded(this.companies);
}
