import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:smart_recuirtment/data/model/company.dart';
import 'package:smart_recuirtment/data/repo/companyRepository.dart';

part 'company_state.dart';

class CompanyCubit extends Cubit<CompanyState> {
  final CompanyRepository companyRepository;

  CompanyCubit(this.companyRepository) : super(CompanyInitial());

  List<Company> companies = [];

  void getAllCompanies() {
    companyRepository.getAllCompanies().then((companyList) {
      emit(CompanyLoaded(companyList));
      companies = companyList;
    });
  }
}
