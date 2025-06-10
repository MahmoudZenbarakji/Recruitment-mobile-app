import 'package:dio/dio.dart';
import 'package:smart_recuirtment/constants/endpoints.dart';
import 'package:smart_recuirtment/constants/strings.dart';

class JobService {
  late Dio dio;

  JobService() {
    BaseOptions options = BaseOptions(
      baseUrl: baseurl,
      receiveDataWhenStatusError: true,
      connectTimeout: Duration(seconds: 20),
      receiveTimeout: Duration(seconds: 20),
    );
    dio = Dio(options);
  }

  Future<List<dynamic>> getAllJobs() async {
    try {
      Response response =
          await dio.get(Endpoints.jobs); // Replace with your endpoint
      return response.data;
    } catch (e) {
      print('Error fetching jobs: $e');
      return [];
    }
  }
}
