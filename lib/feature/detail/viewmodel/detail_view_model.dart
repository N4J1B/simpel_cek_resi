import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../data/model/custom_exception.dart';
import '../../../data/model/failure_model.dart';
import '../../../data/model/resi.dart';
import '../../../data/model/ui_state.dart';
import '../../../data/repository/resi_repository.dart';

class DetailViewModel extends ChangeNotifier {
  final ResiRepository resiRepository;

  DetailViewModel({required this.resiRepository});

  UiState? _uiState;
  FailureModel? _errorInfo;
  Resi? _resi;
  Summary? _summary;
  Detail? _detail;
  List<History>? _history;

  UiState? get uiState => _uiState;
  FailureModel? get errorInfo => _errorInfo;
  Resi? get resi => _resi;
  Summary? get summary => _summary;
  Detail? get detail => _detail;
  List<History>? get history => _history;

  void setUiState(UiState? value) {
    _uiState = value;
    notifyListeners();
  }

  Future<void> getResi(String courier, String awb) async {
    setUiState(UiState.loading);

    try {
      _resi = await resiRepository.getResi(courier, awb);
      _summary = _resi!.data.summary;
      _detail = _resi!.data.detail;
      _history = _resi!.data.history;
      setUiState(null);
    } on CustomException catch (e) {
      _errorInfo = FailureModel(e.statusCode, e.message);
      setUiState(UiState.error);
    } catch (e) {
      _errorInfo = FailureModel(-1, e.toString());
      setUiState(UiState.error);
    } finally {
      notifyListeners();
    }
  }
}
