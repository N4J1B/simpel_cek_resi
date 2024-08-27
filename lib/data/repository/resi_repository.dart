import 'package:dio/dio.dart';

import '../model/custom_exception.dart';
import '../model/failure_model.dart';
import '../model/resi.dart';
import '../service/api_service.dart';

class ResiRepository {
  final ApiService apiService;

  ResiRepository({required this.apiService});

  Future<Resi> getResi(String courier, String awb) async {
    try {
      final data = await apiService.getResi(courier, awb);
      return data;
    } on CustomException {
      rethrow;
    } catch (e) {
      throw CustomException(FailureModel(-1, e.toString()));
    }
  }
}
