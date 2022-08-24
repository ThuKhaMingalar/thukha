import 'package:get/get.dart';
import 'package:thukha/utils/routes/route_url.dart';
import 'package:thukha/view/absentee_detail/absentee_detail.dart';
import 'package:thukha/view/home_screen.dart';
import 'package:thukha/view/login/login_screen.dart';
import 'package:thukha/view/manange_stock_table/bin/manage_stock_binding.dart';
import 'package:thukha/view/manange_stock_table/view/manage_stock_table.dart';
import 'package:thukha/view/my_cart/bin/my_cart_binding.dart';
import 'package:thukha/view/my_cart/view/my_cart_view.dart';
import 'package:thukha/view/order_detail/view/order_detail_view.dart';
import 'package:thukha/view/update_profile/bin/update_profile_binding.dart';
import 'package:thukha/view/update_profile/view/update_profile_view.dart';

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
    binding: MyCartBinding(),
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
  GetPage(
    name: updateProfileScreen, 
    binding: UpdateProfileBinding(),
    page: () => const UpdateProfileView(),
    ),
  GetPage(
    name: absenteeDetailScreen, 
    page: () => const AbsenteeDetailView(),
    ),
];