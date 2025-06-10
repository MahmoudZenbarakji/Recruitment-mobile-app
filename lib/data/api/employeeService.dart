import 'package:dio/dio.dart';
import 'package:smart_recuirtment/constants/strings.dart';
import 'package:smart_recuirtment/constants/endpoints.dart';

class EmployeeService {
  late Dio dio;

  EmployeeService() {
    BaseOptions options = BaseOptions(
      baseUrl: baseurl, // Replace with your actual base URL
      receiveDataWhenStatusError: true,
      connectTimeout: Duration(seconds: 20),
      receiveTimeout: Duration(seconds: 20),
    );
    dio = Dio(options);
  }

  Future<List<dynamic>> getAllEmployees() async {
    try {
      Response response = await dio.get(Endpoints.employees);
      return response.data;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}
