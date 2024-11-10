import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resikuu/controller/mainc.dart';

import '../utils/custom_icon_icons.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final m = Get.find<MainC>();
    return SafeArea(
      child: Obx(
        () => Scaffold(
          extendBody: true,
          body: Builder(
            builder: (context) {
              return m.pages[m.currentIndex.value];
            },
          ),
          // body: PageView.builder(
          //   controller: m.pagec,
          //   onPageChanged: (value) {
          //     m.change(value);
          //   },
          //   itemBuilder: (context, index) {
          //     return m.pages[index];
          //   },
          //   itemCount: 4,
          // ),
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10), topLeft: Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                    color: Colors.black38, spreadRadius: 0, blurRadius: 10),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0),
              ),
              child: BottomNavigationBar(
                elevation: 1,
                type: BottomNavigationBarType.fixed,
                backgroundColor: Color.fromRGBO(93, 153, 241, 1),
                iconSize: 36,
                showUnselectedLabels: false,
                showSelectedLabels: false,
                unselectedItemColor: Color.fromRGBO(255, 255, 255, 1),
                selectedItemColor: Color.fromRGBO(166, 202, 253, 1),
                currentIndex: m.currentIndex.value,
                onTap: m.changePage,
                // m.pagec.jumpToPage(value);,
                items: [
                  BottomNavigationBarItem(
                      icon: Icon(CustomIcon.home), label: "Home"),
                  BottomNavigationBarItem(
                      icon: Icon(CustomIcon.truck), label: "Ongkir"),
                  BottomNavigationBarItem(
                      icon: Icon(CustomIcon.heart), label: "Bookmark"),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
