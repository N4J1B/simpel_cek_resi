import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:resikuu/controller/homec.dart';
import 'package:resikuu/data/service/api_service.dart';
import 'package:resikuu/utils/custom_icon_icons.dart';
import '../data/model/courier.dart';
import 'widgets/my_sliver_app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
  final h = Get.find<HomeC>();
  final apiserve = Get.find<ApiService>();
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
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color(0xFFFAFAFA),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black38, spreadRadius: -2, blurRadius: 10)
                  ],
                ),
                margin: EdgeInsets.only(top: 10, left: 30, right: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'Lacak Pengiriman Anda',
                        style: TextStyle(
                          color: Color(0xFFA7C9FB),
                          fontSize: 24,
                          fontWeight: FontWeight.w900,
                          fontFamily: "Poppins",
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: DropdownMenu(
                        inputDecorationTheme: InputDecorationTheme(
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFFA7C9FB))),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF5D99F1))),
                          hintStyle: TextStyle(
                            color: Color(0xFFA7C9FB),
                          ),
                          iconColor: Color(0xFFA7C9FB),
                          prefixIconColor: Color(0xFFA7C9FB),
                          suffixIconColor: Color(0xFFA7C9FB),
                        ),
                        hintText: "Pilih Kurir",
                        leadingIcon: Icon(CustomIcon.truck2),
                        menuHeight: 250,
                        width: 200,
                        dropdownMenuEntries: Courier.list
                            .map(
                              (e) => DropdownMenuEntry(
                                  value: e.code, label: e.description),
                            )
                            .toList(),
                        onSelected: (value) {
                          h.kurir.value = value!;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 10, bottom: 10, right: 30, left: 30),
                      child: TextField(
                        autocorrect: false,
                        textCapitalization: TextCapitalization.characters,
                        controller: h.resiC,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF5D99F1))),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFFA7C9FB),
                            ),
                          ),
                          hintText: "Masukkan Resi...",
                          hintStyle: TextStyle(color: Color(0xFFA7C9FB)),
                          suffixIcon: IconButton(
                            icon: Icon(
                              CustomIcon.scan,
                              size: 30,
                              color: Color(0xFFA7C9FB),
                            ),
                            onPressed: () {
                              print("scan Pressed");
                            },
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: WidgetStatePropertyAll(
                                Color.fromARGB(158, 255, 255, 255))),
                        onPressed: (() {
                          h.cekResi(apiserve);
                          // h.cekResi(h.resiC.text, h.kurir.value);
                        }),
                        child: Text(
                          "Cek",
                          style: TextStyle(
                            color: Color(0xFF5D99F1),
                            fontSize: 14,
                            fontWeight: FontWeight.w900,
                            fontFamily: "Poppins",
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 30, left: 40, top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Pencarian Terbaru",
                      style: TextStyle(
                        color: Color(0x7B433535),
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        print("Lihat Semua Pressed");
                      },
                      child: Text(
                        "Lihat Semua",
                        style: TextStyle(color: Color(0xFFA7C9FB)),
                      ),
                    )
                  ],
                ),
              ),
              h.storageList == []
                  ? Text("Tidak ada Riwayat Pencarian")
                  : Obx(
                      () => Column(
                        children: h.storageList
                            .map((e) => Container(
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
                                        color: const Color.fromARGB(
                                            255, 146, 146, 146),
                                      )),
                                  height: 50,
                                  child: Text(
                                    e["resi"]!,
                                    style: TextStyle(),
                                  ),
                                ))
                            .toList(),
                      ),
                    ),
            ],
          ),
        )
      ],
    );
  }
}
