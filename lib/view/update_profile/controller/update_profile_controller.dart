import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:thukha/constant/constant.dart';
import 'package:thukha/controller/auth_controller.dart';
import 'package:thukha/utils/widgets/show_loading/show_loading.dart';
import 'package:uuid/uuid.dart';

class UpdateProfileController extends GetxController{
  final AuthController authController = Get.find();
  var selectedImage = "".obs;
  final TextEditingController nameController = TextEditingController();

  Future<void> getImage() async {
    try {
      final imagePicker = ImagePicker();
      final XFile? chooseImage = await imagePicker.pickImage(source: ImageSource.gallery);
      selectedImage.value = chooseImage?.path ?? "";
      debugPrint("*****ImagePath: ${selectedImage.value.length}");
    } catch (e) {
      debugPrint("*****Error Picking Job Image: $e");
    }
  }

  //UpdateProfile
  Future<void> updateProfile() async{
    showLoading();
    if(selectedImage.isNotEmpty){
      final file = File(selectedImage.value);
      try {
        await FirebaseStorage.instance
            .ref()
            .child("profileImages/${Uuid().v1()}")
            .putFile(file)
            .then((snapshot) async {
          await snapshot.ref.getDownloadURL()
          .then((value) async{
            await FirebaseFirestore.instance.collection(userCollection)
            .doc(authController.currentShop.value!.id)
            .update(
              {
              "image": value,
              "name": nameController.text,
              }
            );
            await FirebaseAuth.instance.currentUser!.updateDisplayName(
          nameController.text
        );
        await FirebaseAuth.instance.currentUser!.updatePhotoURL(
          value
        );
          }
          );
        });
        hideLoading();
        Get.back();
      }catch(e){
        hideLoading();
        Get.snackbar("Fail!", "$e");;
      }
    }else{
      await FirebaseFirestore.instance.collection(userCollection)
            .doc(authController.currentShop.value!.id)
            .update(
              {
              "name": nameController.text,
              }
            );
      hideLoading();
      Get.back();
    }
  }

  @override
  void onInit() {
    nameController.text = authController.currentShop.value!.name;
    super.onInit();
  }
}