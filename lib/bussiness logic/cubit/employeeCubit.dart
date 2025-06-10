import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_recuirtment/data/model/employee.dart';
import 'package:smart_recuirtment/data/repo/employeeRepository.dart';
import 'package:meta/meta.dart';

part 'employee_state.dart';

class EmployeeCubit extends Cubit<EmployeeState> {
  final EmployeeRepository employeeRepository;

  EmployeeCubit(this.employeeRepository) : super(EmployeeInitial());

  List<Employee> employees = [];

  void getAllEmployees() {
    employeeRepository.getAllEmployees().then((list) {
      emit(EmployeeLoaded(list));
      employees = list;
    }).catchError((e) {
      emit(EmployeeError("Failed to load employees"));
    });
  }
}
