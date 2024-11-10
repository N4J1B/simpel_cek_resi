import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/ongkirc.dart';
import '../data/service/api_service.dart';
import 'widgets/my_sliver_app_bar.dart';

class OngkirScreen extends StatelessWidget {
  const OngkirScreen({super.key});

  @override
  Widget build(BuildContext context) {
  final o = Get.find<OngkirC>();
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
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
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
                      padding: EdgeInsets.all(15),
                      child: Text(
                        'Cek Ongkos Kirim',
                        style: TextStyle(
                          color: Color(0xFFA7C9FB),
                          fontSize: 24,
                          fontWeight: FontWeight.w900,
                          fontFamily: "Poppins",
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 10, bottom: 10, right: 30, left: 30),
                      child: TextField(
                        style: TextStyle(fontSize: 14),
                        autocorrect: false,
                        textCapitalization: TextCapitalization.characters,
                        controller: o.asalC,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF3183FF))),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFFA7C9FB),
                            ),
                          ),
                          hintText: "Kota Asal...",
                          hintStyle: TextStyle(color: Color(0xFFA7C9FB)),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 10, bottom: 10, right: 30, left: 30),
                      child: TextField(
                        autocorrect: false,
                        textCapitalization: TextCapitalization.characters,
                        controller: o.asalC,
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
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 10, bottom: 10, right: 30, left: 30),
                      child: TextField(
                        autocorrect: false,
                        textCapitalization: TextCapitalization.characters,
                        controller: o.asalC,
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
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 10, bottom: 10, right: 30, left: 30),
                      child: TextField(
                        autocorrect: false,
                        textCapitalization: TextCapitalization.characters,
                        controller: o.asalC,
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
                          // o.cekOngkir(apiserve);
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
            ],
          ),
        )
      ],
    );
  }
}
