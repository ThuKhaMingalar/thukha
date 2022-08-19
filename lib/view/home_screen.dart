import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:thukha/controller/state_controller.dart';
import 'package:thukha/utils/routes/route_url.dart';
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
                    child: CircleAvatar(
                                radius: 12,
                                backgroundColor: Colors.grey,
                                child: Text(
                                  "598",
                                  style: Theme.of(context).textTheme.bodyText2
                                  ?.copyWith(fontSize: 10),
                                ),
                              ),
                    ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 10,),
        ],
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