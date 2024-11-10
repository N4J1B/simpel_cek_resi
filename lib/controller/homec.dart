import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:resikuu/data/model/resi.dart';
import 'package:resikuu/data/service/api_service.dart';
import 'package:resikuu/page/widgets/error_dialog.dart';
import 'package:resikuu/router/route_name.dart';

import '../data/model/custom_exception.dart';

class HomeC extends GetxController {
  final box = GetStorage();
  late Resi response;
  late TextEditingController resiC;
  var kurir = "".obs;

  final storageList = [].obs;

  Future<void> addAndStoreRecent(String resi, String kurir) async {
    final Map storageMap = {};

    storageMap["resi"] = resi;
    storageMap["kurir"] = kurir;

    final x = [
      storageMap,
      ...storageList
    ];

    box.write('recent', x); 
    restoreRecents();
  }

  void restoreRecents() {
    storageList.value = (box.read('recent')??[]); // initializing list from storage
  }

  void cekResi(ApiService serve) async {
    try{
      response = await serve.getResi(kurir.value, resiC.text);
      Get.offNamed(RouteName.detailcek, arguments: response);
    }on CustomException catch(e){
      Get.dialog(ErrorDialog(e: e));
    }
  }

  @override
  void onInit() {
    super.onInit();
    resiC = TextEditingController();
    restoreRecents();
  }

  @override
  InternalFinalCallback<void> get onDelete {
    print("Delete HomeC");
    return super.onDelete;
  }

  @override
  void onClose() {
    print("Close HomeC");
    resiC.dispose();
    super.onClose();
  }

}
