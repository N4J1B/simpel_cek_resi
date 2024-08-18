import 'package:flutter/material.dart';

import '../../../data/model/resi.dart';
import '../../../data/repository/resi_repository.dart';

class DetailViewModel extends ChangeNotifier {
  final ResiRepository resiRepository;

  DetailViewModel({required this.resiRepository});

  Resi? _resi;
  bool _loading = false;
  String _errorMessage = "";

  Resi? get resi => _resi;
  bool get loading => _loading;
  String get errorMessage => _errorMessage;

  Future<void> getResi(String courier, String awb) async {
    _loading = true;
    _errorMessage = "";

    try {
      _resi = await resiRepository.getResi(courier, awb);
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _loading = false;
      notifyListeners();
    }
  }
}
