import 'package:flutter/material.dart';

import '../../../data/model/resi.dart';
import '../../../data/repository/resi_repository.dart';

class DetailViewModel extends ChangeNotifier {
  final ResiRepository resiRepository;

  DetailViewModel({required this.resiRepository});

  Resi? _resi;
  Summary? _summary;
  Detail? _detail;
  List<History>? _history;
  bool _loading = false;
  bool _isFetched = false;
  String _errorMessage = "";

  Resi? get resi => _resi;
  Summary? get summary => _summary;
  Detail? get detail => _detail;
  List<History>? get history => _history;
  bool get loading => _loading;
  bool get isFetched => _isFetched;
  String get errorMessage => _errorMessage;

  Future<void> getResi(String courier, String awb) async {
    _loading = true;
    _isFetched = true;
    _errorMessage = "";

    try {
      _resi = await resiRepository.getResi(courier, awb);
      _summary = _resi!.data.summary;
      _detail = _resi!.data.detail;
      _history = _resi!.data.history;
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _loading = false;
      notifyListeners();
    }
  }
}
