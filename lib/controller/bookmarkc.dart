import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resikuu/data/service/local_service.dart';

import '../data/model/resi.dart';
import '../data/service/api_service.dart';
import '../router/route_name.dart';
import '../data/model/custom_exception.dart';
import '../page/widgets/error_dialog.dart';

class BookmarkC extends GetxController {
  final ApiService apiserve;
  final LocalService localserve;

  BookmarkC({required this.localserve, required this.apiserve});
  var bookmarkList = [].obs;
  late Resi response;

  void remove(String resi, String kurir) async {
    localserve.deleteBookmark(resi, kurir);
    bookmarkList.value = localserve.restoreBookmark();
  }

  Future<void> onclick(String resi, String kurir) async {
    Get.dialog(
      AlertDialog(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Loading'),
          ],
        ),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircularProgressIndicator(),
            ],
          ),
        ),
      ),
      useSafeArea: true,
    );
    try {
      response = await apiserve.getResi(kurir, resi);
      Get.back();
      Get.toNamed(RouteName.detailcek, arguments: [
        response.data.detail,
        response.data.history,
        response.data.summary,
        kurir
      ]);
    } on CustomException catch (e) {
      Get.back();
      Get.dialog(ErrorDialog(e: e));
    }
  }

  @override
  void onInit() async {
    bookmarkList.value = localserve.restoreBookmark();
    super.onInit();
  }
}
