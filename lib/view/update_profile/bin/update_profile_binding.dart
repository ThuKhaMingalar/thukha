import 'package:get/get.dart';
import 'package:thukha/view/update_profile/controller/update_profile_controller.dart';

class UpdateProfileBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(UpdateProfileController());
  }

}