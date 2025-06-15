import 'package:dio/dio.dart';
import 'package:smart_recuirtment/data/model/Employee.dart';

class EmployeeApiService {
  final Dio _dio;

  EmployeeApiService(this._dio);

  Future<List<Employee>> fetchEmployees() async {
    try {
      final response =
          await _dio.get('https://tomoh.dimasco.net/api/employees');

      if (response.statusCode == 200 && response.data['status'] == true) {
        final data = response.data['data']['data'] as List;
        return data.map((e) => Employee.fromJson(e)).toList();
      } else {
        throw Exception('Failed to load employees');
      }
    } catch (e) {
      throw Exception('API error: $e');
    }
  }
}
