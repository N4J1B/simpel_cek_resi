import 'package:get/get.dart';
import 'package:resikuu/page/resi_detail.dart';
import 'package:resikuu/router/bindings.dart';

import 'route_name.dart';
import '../page/main_screen.dart';

class AppPage {
  static final pages = [
    GetPage(
      name: RouteName.main,
      page: () => MainScreen(),
      binding: RootBinding(),
      // children: [
      //   GetPage(
      //     name: RouteName.home,
      //     page: () => HomeScreen(),
      //     binding: HomeBinding(),
      //   ),
      //   GetPage(
      //     name: RouteName.ongkir,
      //     page: () => OngkirScreen(),
      //     binding: OngkirBinding(),
      //   ),
      //   GetPage(
      //     name: RouteName.bookmark,
      //     page: () => BookmarkScreen(),
      //     binding: BookmarkBinding(),
      //   ),
      //   GetPage(
      //     name: RouteName.profil,
      //     page: () => ProfileScreen(),
      //     binding: ProfilBinding(),
      //   ),
      // ],
    ),
    GetPage(
      name: RouteName.detailcek,
      page: () => ResiDetail(),
      binding: DetailResiBinding(),
    ),
    // GetPage(
    //   name: RouteName.detailongkir,
    //   page: () => OngkirDetail(),
    //   binding: BindingsBuilder(() {
    //     Get.put(OngkirDetailC());
    //   })),
  ];
}
