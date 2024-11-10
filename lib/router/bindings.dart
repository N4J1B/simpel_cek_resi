import 'package:get/get.dart';
import 'package:resikuu/controller/detailresic.dart';

import '../controller/bookmarkc.dart';
import '../controller/mainc.dart';
import '../controller/profilc.dart';
import '../controller/homec.dart';
import '../controller/ongkirc.dart';

class RootBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainC>(() => MainC());
    Get.lazyPut<HomeC>(() => HomeC());
    Get.lazyPut<OngkirC>(() => OngkirC());
    Get.lazyPut<BookmarkC>(() => BookmarkC());
  }
}

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeC>(() => HomeC());
  }
}

class OngkirBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OngkirC>(() => OngkirC());
  }
}

class BookmarkBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BookmarkC>(() => BookmarkC());
  }
}

class ProfilBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfilC>(() => ProfilC());
  }
}

class DetailResiBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailresiC>(() => DetailresiC());
  }
}
