import 'package:get/get.dart';
import 'package:resikuu/data/model/resi.dart';
import 'package:resikuu/data/service/local_service.dart';

class DetailresiC extends GetxController {
  final Resi data = Get.arguments as Resi;
  late Summary summary = data.data.summary;
  late Detail detail = data.data.detail;
  late List<History> history = data.data.history;
  final statusBook = false.obs;

  void bookmarkchange(LocalService localserve) {
    if (statusBook.value == false) {
      localserve.addAndStoreBookmark(summary.awb, summary.courier);
      statusBook.toggle();
    } else {
      localserve.deleteBookmark(summary.awb, summary.courier);
      statusBook.toggle();
    }
  }
}
