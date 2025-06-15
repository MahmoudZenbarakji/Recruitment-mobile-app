import 'package:smart_recuirtment/data/api/employeeService.dart';
import 'package:smart_recuirtment/data/model/Employee.dart';

class EmployeeRepository {
  final EmployeeApiService apiService;

  EmployeeRepository(this.apiService);

  Future<List<Employee>> getEmployees() {
    return apiService.fetchEmployees();
  }
}
