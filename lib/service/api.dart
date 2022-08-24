import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart' as dio;
import 'package:dio/dio.dart';
import 'package:thukha/constant/constant.dart';
import 'package:thukha/utils/routes/route_url.dart';

import '../constant/fcm_key.dart';
import '../model/shop.dart';

class Api {
  final dio.Dio _dio = dio.Dio();
  //Send Notificaiton After order uploaded
  static Future<void> sendPushToAdmin(String title, String message) async {
    FirebaseFirestore.instance.collection(userCollection)
    .withConverter<Shop>(
      fromFirestore: (data,__) => Shop.fromJson(data.data()!), 
      toFirestore: (user,__) => user.toJson(),
      )
    .where("status", isGreaterThan: 0)
    .get()
    .then((value) async{
      final adminUser = value.docs.first.data();
    final jsonBody = <String, dynamic>{
      "notification": <String, dynamic>{
        "title": title,
        "body": message,
      },
      "data": <String, dynamic>{
        "click_action": "FLUTTER_NOTIFICATION_CLICK",
        "route": homeScreen,
      },
      "to": adminUser.token,
    };
    await Dio().post("https://fcm.googleapis.com/fcm/send",
        data: jsonBody,
        options: Options(headers: {
          "Authorization": "key=$fcmKey",
          "Content-Type": "application/json"
        }));
    });
    
  }

  static Future<void> sendPushToUser(
    String title, 
    String message,
    String userId,
  ) async {
    FirebaseFirestore.instance.collection(userCollection)
    .withConverter<Shop>(
      fromFirestore: (data,__) => Shop.fromJson(data.data()!), 
      toFirestore: (user,__) => user.toJson(),
      )
    .doc(userId)
    .get()
    .then((value) async{
      final user = value.data()!;
    final jsonBody = <String, dynamic>{
      "notification": <String, dynamic>{
        "title": title,
        "body": message,
      },
      "data": <String, dynamic>{
        "click_action": "FLUTTER_NOTIFICATION_CLICK",
        "route": homeScreen,
      },
      "to": user.token,
    };
    await Dio().post("https://fcm.googleapis.com/fcm/send",
        data: jsonBody,
        options: Options(headers: {
          "Authorization": "key=$fcmKey",
          "Content-Type": "application/json"
        }));
    });
    
  }
}
