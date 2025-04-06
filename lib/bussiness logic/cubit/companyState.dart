/*import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_app/data/models/company_model.dart';
import 'package:your_app/data/repository/company_repository.dart';

class CompanyCubit extends Cubit<List<CompanyModel>> {
  final CompanyRepository repository;

  CompanyCubit(this.repository) : super([]);

  void fetchCompanies(Map<String, dynamic> filters) async {
    final companies = await repository.getCompanies(filters);
    emit(companies);
  }
}
*/