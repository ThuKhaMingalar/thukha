import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:thukha/controller/state_controller.dart';
import 'package:thukha/view/bottom_nav/history_view.dart';
import 'package:thukha/view/bottom_nav/home_view.dart';
import 'package:thukha/view/bottom_nav/profile_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final StateController stateController = Get.find();
    const List<Widget> bNBWidgets = [HomeView(),HistoryView(),ProfileView()];
    return Scaffold(
      appBar: AppBar(
        title: const Text("ThuKha Mingalar"),
      ),
      body: Obx(() => bNBWidgets[stateController.bNBIndex.value]),
      bottomNavigationBar: Obx(
        () {
          return BottomNavigationBar(
            currentIndex: stateController.bNBIndex.value,
            onTap: stateController.changeBNBIndex,
            items: const [
              BottomNavigationBarItem(
                label: "Home",
                icon: Icon(FontAwesomeIcons.house,size: 30)),
              BottomNavigationBarItem(
                label: "History",
                icon: Icon(FontAwesomeIcons.checkToSlot,size: 30),),
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