import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';
import 'package:thukha/constant/constant.dart';

import '../../controller/auth_controller.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.find();
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //AppLogo
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
                child: CachedNetworkImage(
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
                          imageUrl: appLogo,
                          fit: BoxFit.cover,
                          height: 200,
                        ),
              ),
            ),
              //AppName
              Text(
                "ThuKha Mingalar".toUpperCase(),
                style: GoogleFonts.irishGrover(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10,),
              //Signin
               Text(
                "Sign in".toUpperCase(),
                style: Theme.of(context).textTheme
                .subtitle1?.copyWith(
                  fontSize: 18,
                ),
              ),
              //With
              Text(
                "with".toUpperCase(),
                style: Theme.of(context).textTheme
                .subtitle1?.copyWith(
                  fontSize: 10,
                ),
              ),
              const SizedBox(height: 10,),
              //Google
              SizedBox(
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                  ),
                  onPressed: (){
                    authController.signInWithGoogle();
                  }, 
                  child: Text(
                    "Google",
                    style: Theme.of(context)
                    .textTheme.headline2?.copyWith(color: Colors.white,),
                  ),
                ),
              ),
              const SizedBox(height: 10,),
              //Apple
               SizedBox(
                height: 50,
                 child: ElevatedButton(
                  onPressed: (){
                    //TODO
                  }, 
                  child: Text(
                    "Apple",
                    style: Theme.of(context)
                    .textTheme.headline2?.copyWith(color: Colors.white,),
                  ),
              ),
               ),
            ],
          ),
        ),
      ),
    );
  }
}