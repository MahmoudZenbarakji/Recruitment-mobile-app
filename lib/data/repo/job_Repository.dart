import 'package:dio/dio.dart';
import 'package:smart_recuirtment/data/model/Job.dart';

class JobRepository {
  final Dio _dio = Dio();
  final String baseUrl = 'https://tomoh.dimasco.net/api/jobs';

  Future<List<Job>> getAllJobs() async {
    try {
      final response = await _dio.get(baseUrl);

      // ✅ Correct extraction of the nested job list
      final List<dynamic> jobList = response.data['data']['data'];

      return jobList.map((json) => Job.fromJson(json)).toList();
    } catch (e) {
      print('DEBUG: ${e.toString()}');
      throw Exception('Failed to load jobs: $e');
    }
  }
}
