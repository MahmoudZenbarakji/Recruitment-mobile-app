import 'package:smart_recuirtment/data/api/companyapiService.dart';
import 'package:smart_recuirtment/data/model/company.dart';

class CompanyRepository {
  final CompanyService companyService;

  CompanyRepository(this.companyService);

  Future<List<Company>> getAllCompanies() async {
    final companies = await companyService.getAllCompanies();
    return companies.map((item) => Company.fromJson(item)).toList();
  }
}
