import 'package:get/get.dart';
import 'package:thukha/utils/routes/route_url.dart';
import 'package:thukha/view/home_screen.dart';
import 'package:thukha/view/login/login_screen.dart';
import 'package:thukha/view/manange_stock_table/bin/manage_stock_binding.dart';
import 'package:thukha/view/manange_stock_table/view/manage_stock_table.dart';
import 'package:thukha/view/my_cart/view/my_cart_view.dart';
import 'package:thukha/view/order_detail/view/order_detail_view.dart';

List<GetPage> getPages = [
  GetPage(
    name: homeScreen, 
    page: () => const HomeScreen(),
    ),
  GetPage(
    name: orderDetailScreen, 
    page: () => const OrderDetailView(),
    ),
  GetPage(
    name: myCartScreen, 
    page: () => const MyCartView(),
    ),
  GetPage(
    name: loginScreen, 
    page: () => const LoginScreen(),
    ),
  GetPage(
    name: manageStockStableScreen, 
    binding: ManageStockBinding(),
    page: () => const ManageStockTable(),
    ),
];