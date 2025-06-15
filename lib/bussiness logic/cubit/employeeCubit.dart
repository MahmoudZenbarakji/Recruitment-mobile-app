import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_recuirtment/bussiness%20logic/bloc/employee_event.dart';
import 'package:smart_recuirtment/data/repo/employeeRepository.dart';
import '../bloc/employee_event.dart';
import 'employee_state.dart';

class EmployeeBloc extends Bloc<EmployeeEvent, EmployeeState> {
  final EmployeeRepository repository;

  EmployeeBloc(this.repository) : super(EmployeeInitial()) {
    on<LoadEmployees>((event, emit) async {
      emit(EmployeeLoading());
      try {
        final employees = await repository.getEmployees();
        emit(EmployeeLoaded(employees));
      } catch (e) {
        emit(EmployeeError(e.toString()));
      }
    });
  }
}
