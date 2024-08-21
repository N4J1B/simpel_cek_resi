import 'package:dio/dio.dart';

import '../../utils/constants.dart';
import '../model/resi.dart';

class ApiService {
  final Dio _dio;

  ApiService({required Dio dio}) : _dio = dio;

  Future<Resi> getResi(String courier, String awb) async {
    final finalUrl = '$url?api_key=$apiKey&courier=$courier&awb=$awb';

    try {
      final response = await _dio.get(finalUrl);
      if (response.statusCode == 200) {
        return Resi.fromJson(response.data);
      } else {
        throw Exception(
            'Failed to fetch data with status code: ${response.statusCode} and error: ${response.statusMessage}');
      }
    } catch (e) {
      throw Exception('An error occurred: $e');
    }
  }
}
