import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:thukha/constant/constant.dart';
import 'package:thukha/constant/mock.dart';
import 'package:thukha/controller/auth_controller.dart';

import '../../utils/routes/route_url.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.find();
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 20,),
          //Profile Image
          Card(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(100)
              )
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(100.0)
              ),
              child: Obx(
                () {
                  return CachedNetworkImage(
                        progressIndicatorBuilder: (context, url, status) {
                          return Shimmer.fromColors(
                            // ignore: sort_child_properties_last
                            child: Container(
                              height: 140,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(100)
                                )
                              ),
                            ),
                            baseColor: Colors.grey.shade300,
                            highlightColor: Colors.white,
                          );
                        },
                        errorWidget: (context, url, whatever) {
                          return const Text("Image not available");
                        },
                        imageUrl: (authController.currentShop.value?.status == 5) ?
                        nullUserImage : authController.currentShop.value!.image,
                        fit: BoxFit.cover,
                        height: 140,
                      );
                }
              ),
            ),
          ),
          const SizedBox(height: 15),
          //Authenticated User Or NOt
          Obx(() => (authController.currentShop.value?.status == 5) ?
          const UnAuthenticatedProfile()
          :
          const AuthenticatedProfile())
        ],
      ),
    );
  }
}

class AuthenticatedProfile extends StatelessWidget {
  const AuthenticatedProfile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.find();
    final shop = authController.currentShop.value!;
    return Column(
      children: [
        //Name
        Text(
          shop.name.toUpperCase(),
          style: Theme.of(context).textTheme
          .headline1,
        ),
        //LogOut
        TextButton(
          onPressed: () => authController.logOut(),
          child: Text(
            "LOG OUT".toUpperCase(),
          style: Theme.of(context).textTheme
          .headline3,
          ),
        ),
        //Delete
        TextButton(
          onPressed: (){},
          child: Text(
            "DELETE ACCOUNT".toUpperCase(),
          style: Theme.of(context).textTheme
          .headline3,
          ),
        ),
      ],
    );
  }
}

class UnAuthenticatedProfile extends StatelessWidget {
  const UnAuthenticatedProfile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.find();
    return Column(
      children: [
        //Name
        Text(
          "Guest".toUpperCase(),
          style: Theme.of(context).textTheme
          .headline1,
        ),
        //LogOut
        TextButton(
          onPressed: () => Get.toNamed(loginScreen),
          child: Text(
            "LOG IN".toUpperCase(),
          style: Theme.of(context).textTheme
          .headline3,
          ),
        ),
      
      ],
    );
  }
}