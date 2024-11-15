import 'package:get/get.dart';
import 'package:resikuu/data/model/resi.dart';
import 'package:resikuu/data/service/local_service.dart';

class DetailresiC extends GetxController {
  final LocalService localserve;

  DetailresiC({required this.localserve});

  final Detail detail = Get.arguments[0];
  final List<History> history = Get.arguments[1];
  final Summary summary = Get.arguments[2];
  final String kurirkode = Get.arguments[3];
  final statusBook = false.obs;

  void bookmarkchange() {
    if (statusBook.value == false) {
      localserve.addAndStoreBookmark(summary.awb, summary.courier, kurirkode);
      statusBook.toggle();
    } else {
      localserve.deleteBookmark(summary.awb, summary.courier);
      statusBook.toggle();
    }
  }

  @override
  void onInit() {
    statusBook.value = localserve.isBookmarked(summary.awb, summary.courier);
    super.onInit();
  }
}
