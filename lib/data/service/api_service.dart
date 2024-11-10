import 'package:dio/dio.dart';

import '../../utils/constants.dart';
import '../model/custom_exception.dart';
import '../model/failure_model.dart';
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
        throw CustomException(
            FailureModel(response.statusCode, response.statusMessage));
      }
    } on DioException catch (e) {
      throw CustomException(FailureModel(e.response?.statusCode, e.message));
    } catch (e) {
      throw CustomException(FailureModel(-1, e.toString()));
    }
  }
}
