import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:thukha/constant/constant.dart';
import 'package:thukha/controller/auth_controller.dart';
import '../../utils/routes/route_url.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.find();
    return  SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: () => Get.toNamed(updateProfileScreen), 
                icon: const Icon(FontAwesomeIcons.penToSquare),
              ),
            ),
            //Profile Image
            ImageProfile(authController: authController),
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

class ImageProfile extends StatelessWidget {
  const ImageProfile({
    Key? key,
    required this.authController,
  }) : super(key: key);

  final AuthController authController;

  @override
  Widget build(BuildContext context) {
    return Obx(
        () {
        return CachedNetworkImage(
          imageBuilder: (context,imageProvider){
            return CircleAvatar(
              radius: 100,
              backgroundColor: Colors.black,
              child: CircleAvatar(
                radius: 98,
                backgroundImage: imageProvider,
              ),
            );
          },
              progressIndicatorBuilder: (context, url, status) {
                return Shimmer.fromColors(
                  // ignore: sort_child_properties_last
                  child: const CircleAvatar(
                    radius: 100,
                    backgroundColor: Colors.white,
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
            );
      }
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
        Obx(
           () {
            return Text(
              authController.currentShop.value!.name.toUpperCase(),
              style: Theme.of(context).textTheme
              .headline1,
            );
          }
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
          onPressed: () => authController.deleteAccount(),
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