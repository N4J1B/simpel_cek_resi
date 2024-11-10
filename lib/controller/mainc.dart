import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../page/bookmark_screen.dart';
import '../page/home_screen.dart';
import '../page/ongkir_screen.dart';
import '../page/profile_screen.dart';

class MainC extends GetxController {
  var currentIndex = 0.obs;
  final pagec = PageController();

  final List<Widget> pages = [
    HomeScreen(),
    OngkirScreen(),
    BookmarkScreen(),
    ProfileScreen()
  ];

  void changePage(int index) {
    currentIndex.value = index;
  }

  @override
  void onClose() {
    pagec.dispose();
    super.onClose();
  }
}
