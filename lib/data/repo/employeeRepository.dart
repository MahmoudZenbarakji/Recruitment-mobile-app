import 'package:smart_recuirtment/data/api/employeeService.dart';
import 'package:smart_recuirtment/data/model/employee.dart';

class EmployeeRepository {
  final EmployeeService employeeService;

  EmployeeRepository(this.employeeService);

  Future<List<Employee>> getAllEmployees() async {
    final data = await employeeService.getAllEmployees();
    return data.map((e) => Employee.fromJson(e)).toList();
  }
}
