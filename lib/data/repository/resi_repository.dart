import 'package:dio/dio.dart';

import '../model/resi.dart';
import '../service/api_service.dart';

class ResiRepository {
  final ApiService apiService;

  ResiRepository({required this.apiService});

  Future<Resi> getResi(String courier, String awb) async {
    try {
      final data = await apiService.getResi(courier, awb);
      return data;
    } on DioException catch (e) {
      throw Exception(e.message);
    }
  }
}
