import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thukha/controller/auth_controller.dart';
import 'package:thukha/controller/data_controller.dart';
import 'package:thukha/controller/state_controller.dart';
import 'package:thukha/utils/routes/route_url.dart';
import 'package:thukha/utils/routes/routes.dart';
import 'package:thukha/utils/theme/app_theme.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) 
async {
  await Firebase.initializeApp();
  print('Handling a background message ${message.messageId}');
}
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  Get.put(AuthController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.put(StateController());
    Get.put(DataController());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme(),
      initialRoute: homeScreen,
      getPages: getPages,
    );
  }
}
