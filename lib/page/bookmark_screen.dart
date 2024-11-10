import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resikuu/controller/bookmarkc.dart';
import 'package:resikuu/data/service/local_service.dart';

import 'widgets/my_sliver_app_bar.dart';

class BookmarkScreen extends StatelessWidget {
  const BookmarkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final b = Get.find<BookmarkC>();
    final localserve = Get.find<LocalService>();

    return CustomScrollView(
      slivers: [
        SliverPersistentHeader(
          delegate: MySliverAppBar(
              title: "ResiKuu",
              subText: "Ini Adalah Subtext",
              maxExtent: 210,
              minExtent: 85),
          floating: true,
          pinned: true,
        ),
        SliverToBoxAdapter(
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                width: double.infinity,
                margin:
                    EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 7),
                padding: EdgeInsets.only(left: 20, right: 20),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black38, spreadRadius: 0, blurRadius: 5),
                  ],
                  borderRadius: BorderRadius.circular(15),
                  color: Color(0xFFFAFAFA),
                  border: Border.all(
                    color: const Color.fromARGB(255, 146, 146, 146),
                  ),
                ),
                height: 70,
                child: Text(
                  "Bookmark",
                  style: TextStyle(
                    color: Color(0xFFA7C9FB),
                    fontSize: 30,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              localserve.bookmarkList == []
                  ? Text("Tidak ada Bookmark")
                  : Column(
                      children: localserve.bookmarkList
                          .map(
                            (e) => Container(
                              alignment: Alignment.centerLeft,
                              width: double.infinity,
                              margin: EdgeInsets.only(
                                  left: 40, right: 40, top: 10, bottom: 7),
                              padding: EdgeInsets.only(left: 20, right: 20),
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black38,
                                      spreadRadius: 0,
                                      blurRadius: 5),
                                ],
                                borderRadius: BorderRadius.circular(15),
                                color: Color(0xFFFAFAFA),
                                border: Border.all(
                                  color:
                                      const Color.fromARGB(255, 146, 146, 146),
                                ),
                              ),
                              height: 50,
                              child: Text(
                                e["resi"]!,
                                style: TextStyle(),
                              ),
                            ),
                          )
                          .toList(),
                    ),
            ],
          ),
        ),
      ],
    );
  }
}
