import '../model/resi.dart';
import '../service/api_service.dart';

class ResiRepository {
  final ApiService apiService;

  ResiRepository({required this.apiService});

  Future<Resi> getResi(String courier, String awb) async {
    try {
      final data = await apiService.getResi(courier, awb);
      return data;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
