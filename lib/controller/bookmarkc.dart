import 'package:get/get.dart';

class BookmarkC extends GetxController {

  

  @override
  void onInit() {
    print("init Bookmark Controller");

    super.onInit();
  }

  @override
  void onClose() {
    print("dispose Bookmark Controller");
    super.onClose();
  }
}
