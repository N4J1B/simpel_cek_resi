import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:resikuu/data/service/local_service.dart';

import 'router/bindings.dart';
import 'router/route_name.dart';
import 'router/app_page.dart';
import 'data/service/api_service.dart';
import 'page/main_screen.dart';

Future<void> main() async {
  // Create Dio instance for HTTP requests
  final Dio dio = Dio();
  
  //local storage
  await GetStorage.init();
  await Get.putAsync<ApiService>(()async => ApiService(dio: dio));
  Get.lazyPut<LocalService>(() => LocalService());

  runApp(
      MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.fade,
      initialRoute: RouteName.main,
      title: "ResiKuu",
      initialBinding: RootBinding(),
      getPages: AppPage.pages,
      home: MainScreen(),
    );
  }
}
