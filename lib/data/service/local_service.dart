import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LocalService extends GetxService {
  GetStorage box = GetStorage();
  List bookmarkList = [].obs;

  Future<void> addAndStoreBookmark(String resi, String kurir) async {
    final storageMap = {};

    storageMap["resi"] = resi;
    storageMap["kurir"] = kurir;

    if (!bookmarkList.any(
        (bookmark) => bookmark["resi"] == resi && bookmark["kurir"] == kurir)) {
      bookmarkList.add(storageMap);
    }

    await box.write('bookmark', bookmarkList);
    restoreBookmark();
  }

  void restoreBookmark() {
    bookmarkList = box.read('bookmark') ?? [];
  }

  void deleteBookmark(String resi, String kurir) async {
    final Map storageMap = {};

    storageMap["resi"] = resi;
    storageMap["kurir"] = kurir;

    bookmarkList.removeWhere(
        (bookmark) => bookmark["resi"] == resi && bookmark["kurir"] == kurir);

    box.write('bookmark', bookmarkList);
    restoreBookmark();
  }

  @override
  void onInit() {
    super.onInit();
    restoreBookmark();
  }
}
