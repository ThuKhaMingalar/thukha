import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:thukha/controller/data_controller.dart';
import 'package:thukha/controller/state_controller.dart';
import 'package:thukha/utils/routes/route_url.dart';
import 'package:thukha/view/bottom_nav/admin/home_view.dart';
import 'package:thukha/view/bottom_nav/history_view.dart';
import 'package:thukha/view/bottom_nav/profile_view.dart';
import 'package:thukha/view/bottom_nav/user/user_absentee_view.dart';

import '../controller/auth_controller.dart';
import 'bottom_nav/admin/absentee_view.dart';
import 'bottom_nav/user/user_home_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final StateController stateController = Get.find();
    final AuthController authController = Get.find();
    final List<Widget> bNBWidgets = [
      const HomeView(),
      const HistoryView(),
      const AbsenteeView(),
      const ProfileView(),
    ];
    final List<Widget> userBNBWidgets = [
       const UserHomeView(),
      const HistoryView(),
       const UserAbsenteeView(),
      const ProfileView(),
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text("ThuKha Mingalar"),
        actions: [
          Padding(
            padding: const EdgeInsets.all(0),
            child: SizedBox(
              height: 50,
              width: 70,
              child: Stack(
                children: [
                    Align(
                    alignment: Alignment.center,
                    child: IconButton(
                      onPressed: () => Get.toNamed(myCartScreen),
                      icon:const Icon(FontAwesomeIcons.cartPlus,size: 30)),
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: GetBuilder<DataController>(
                      builder: (controller) {
                        return CircleAvatar(
                                    radius: 12,
                                    backgroundColor: Colors.grey.shade300,
                                    child: Text(
                                      controller.cartMap.length.toString(),
                                      style: Theme.of(context).textTheme.bodyText2
                                      ?.copyWith(fontSize: 10),
                                    ),
                                  );
                      }
                    ),
                    ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 10,),
        ],
      ),
      body: Obx(() {
        final shop= authController.currentShop.value!;
        return shop.status > 0 ?
         bNBWidgets[stateController.bNBIndex.value] :
         userBNBWidgets[stateController.bNBIndex.value];
      }),
      bottomNavigationBar: Obx(
        () {
          return BottomNavigationBar(
            currentIndex: stateController.bNBIndex.value,
            onTap: stateController.changeBNBIndex,
            selectedItemColor: Colors.black,
            items: const [
              BottomNavigationBarItem(
                label: "Home",
                icon: Icon(FontAwesomeIcons.house,size: 30)),
              BottomNavigationBarItem(
                label: "History",
                icon: Icon(FontAwesomeIcons.checkToSlot,size: 30),),
              BottomNavigationBarItem(
                label: "Absentee",
                icon: Icon(FontAwesomeIcons.userXmark,size: 30),),
              BottomNavigationBarItem(
                label: "Profile",
                icon: Icon(FontAwesomeIcons.circleUser,size: 30)),
            ],
            );
        }
      ),
    );
  }
}