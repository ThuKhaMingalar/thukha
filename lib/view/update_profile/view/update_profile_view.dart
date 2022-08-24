import 'dart:io';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:thukha/view/update_profile/controller/update_profile_controller.dart';

import '../../../controller/auth_controller.dart';

class UpdateProfileView extends StatelessWidget {
  const UpdateProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.find();
    final UpdateProfileController updateController = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Update Profile"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20,left: 20,right: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              //Image
              SizedBox(
                  height: 200,
                  child: Stack(
                    children: [
                      Align(
                  alignment: Alignment.center,
                  child: Obx(
                    () {
                      return updateController.selectedImage.isEmpty ?
                      OriginalImage(authController: authController) : 
                      SelectedImageWidget(image: updateController.selectedImage.value);
                    }
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: CircleAvatar(
                  radius: 100,
                  backgroundColor: Colors.black.withOpacity(0.5),
                )
              ),
              //Upload Image Button
              Align(
                alignment: Alignment.bottomCenter,
                child: IconButton(
                  onPressed: () => updateController.getImage(), 
                  icon: const Icon(
                    FontAwesomeIcons.images,
                    color: Colors.white,
                  )
                ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
              //Name
              Row(
                children: [
                  Text(
                    "Name:",
                    style: Theme.of(context).textTheme
                    .headline3,
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: updateController.nameController,
                      style: Theme.of(context).textTheme.bodyText1,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.only(left: 20),
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              //Update Button
              ElevatedButton(
                onPressed: () => updateController.updateProfile(), 
                child: Text(
                  "Update",
                  style: Theme.of(context).textTheme
                  .bodyText1?.copyWith(color: Colors.white,),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SelectedImageWidget extends StatelessWidget {
  const SelectedImageWidget ({Key? key,
  required this.image,}) : super(key: key);
  final String image;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 100,
      backgroundImage: FileImage(
        File(image),
      ),
    );
  }
}

class OriginalImage extends StatelessWidget {
  const OriginalImage({
    Key? key,
    required this.authController,
  }) : super(key: key);

  final AuthController authController;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 100,
      backgroundImage: NetworkImage(authController.currentShop.value!.image,)
    );
  }
}
