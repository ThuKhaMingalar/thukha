import 'package:get/get.dart';
import 'package:thukha/utils/routes/route_url.dart';
import 'package:thukha/view/home_screen.dart';

List<GetPage> getPages = [
  GetPage(
    name: homeScreen, 
    page: () => const HomeScreen(),
    ),
];