import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OngkirC extends GetxController {
  late TextEditingController asalC;
  late TextEditingController tujuanC;
  late TextEditingController beratC;

  @override
  void onInit() {
    print("init Ongkir Controller");
    super.onInit();
    asalC = TextEditingController();
    tujuanC = TextEditingController();
    tujuanC = TextEditingController();
  }

  @override
  void onClose() {
    print("dispose Ongkir Controller");
    super.onClose();
    asalC.dispose();
    tujuanC.dispose();
    beratC.dispose();
  }
}
