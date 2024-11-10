import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../controller/homec.dart';

class RecentSearch extends StatefulWidget {
  const RecentSearch({super.key});

  @override
  State<RecentSearch> createState() => _RecentSearchState();
}

class _RecentSearchState extends State<RecentSearch> {
  final c = Get.find<HomeC>();
  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30, left: 30, right: 20, bottom: 60),
      child: Column(
        children: [
                
        ],
      ),
    );
  }
}
