import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:thukha/constant/constant.dart';
import 'package:thukha/model/shop.dart';
import 'package:thukha/utils/widgets/show_loading/show_loading.dart';

class AuthController extends GetxController {
  final firebaseAuth = FirebaseAuth.instance;
  final firebaseFirestore = FirebaseFirestore.instance;
  var currentUserDeviceToken = "".obs;
  var isAuthenticated = true.obs;
  Rxn<Shop> currentShop = Rxn<Shop>(Shop(
                            id: "guestID", 
                            name: "Guest", 
                            image: nullUserImage, 
                            status: 5,
                            token: "mockToken"
                          ));
    
  bool isShop(){
    if(currentShop.value!.status == 0){
      return true;
    }else{
      return false;
    }         
  }


  @override
  void onInit() {
    getDeviceToken();
    FirebaseMessaging.instance.onTokenRefresh.listen(saveTokenToDatabase);
    /**Listen For User Authenticated*/
    firebaseAuth.userChanges().listen((user) {
      if(user == null){//If user is null we sign in with Annonymus
        signInWithAnonymous();
      }else{ //If user is not null
       if(!(user.photoURL == null)){ //If user is not include photo
       //url,this user will be anonymous user,if not real user
        (checkUserIsExist(user.uid))
       .then((userExist){
        if(userExist){//If user have already defined in DB.
          assignUser(user.uid);
        }else{
          createNewUserAndAssignUser(user);
        }
        //Listen UserCollection whether user is exist or not
        firebaseFirestore.collection(userCollection)
        .doc(user.uid)
        .snapshots()
        .listen((event) {
          if(event.data() == null){
            signInWithAnonymous();
            return;
          }
          currentShop.value = Shop.fromJson(event.data()!);
        });
       });
       }
      }
    });
    super.onInit();
  }

  Future<void> signInWithAnonymous() async{
    currentShop.value = Shop(
                            id: "guestID", 
                            name: "Guest", 
                            image: nullUserImage, 
                            status: 5,
                            token: "mockToken"
                          );
    try {
          await FirebaseAuth.instance.signInAnonymously();
      } on FirebaseAuthException catch (e) {
        switch (e.code) {
          case "operation-not-allowed":
            print("Anonymous auth hasn't been enabled for this project.");
            break;
          default:
            print("Unknown error.");
        }
      }
  }
  
  Future<bool> checkUserIsExist(String userID) async{
    final snapshot = await FirebaseFirestore.instance
              .collection(userCollection)
              .doc(userID)
              .get();
    return snapshot.exists;
  }
  
  Future<void> assignUser(String id) async{
    firebaseFirestore.collection(userCollection)
    .doc(id)
    .get()
    .then((value) => {
      currentShop.value = Shop.fromJson(value.data()!)
    });
  }
  
  Future<void> createNewUserAndAssignUser(User user) async{
    currentShop.value = Shop(
      id: user.uid, 
      name: user.displayName ?? "", 
      image: user.photoURL ?? "", 
      status: 0,
      token: currentUserDeviceToken.value,
    );
    try {
      await firebaseFirestore.collection(userCollection)
    .doc(user.uid)
    .set(currentShop.value!.toJson());
    } catch (e) {
      Get.snackbar("Fail", "$e");
    }
  }

  Future<void> signInWithGoogle() async {
     try{
       // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      showLoading();
      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      await FirebaseAuth.instance.signInWithCredential(credential);
      hideLoading();
      Get.back();
     } on FirebaseAuthException catch(e){
      debugPrint("GoogleSignInError: $e");
      Get.snackbar("Fail!", "$e");
     }
  }

  Future<void> logOut() async{
    await FirebaseAuth.instance.signOut();
  }

  Future<void> deleteAccount() async{
    showLoading();
   await firebaseFirestore.collection(userCollection).doc(
    currentShop.value!.id
   ).delete()
    .then((value) async{
      try {
        await FirebaseAuth.instance.currentUser?.delete();
      }on FirebaseAuthException catch (e){
        if (e.code == "requires-recent-login") {
          //TODO: WE NEED TO PROMPT TO REAUTHENTICATE,then delete() again
          debugPrint("**********${e.code}");
          return;
        }
        debugPrint("**********${e.code}");
      }
    });
    hideLoading();
  }

  //-------------------------GET TOKEN--------------------//
    Future<void> getDeviceToken() async{
      try{
        currentUserDeviceToken.value = await FirebaseMessaging.instance.getToken() ?? "";
      }catch(e){
        debugPrint("**************Error Getting Token: $e");
      }
    }
    Future<void> saveTokenToDatabase(String token) async {
  FirebaseFirestore.instance.runTransaction((transaction) async{
    try {
      final secureSnapshot = await FirebaseFirestore.instance
    .collection(userCollection)
    .doc(currentShop.value!.id).get();
    transaction.update(secureSnapshot.reference, {
        "token": currentUserDeviceToken.value,
        });
    } catch (e) {
      Get.snackbar("Fail!", "$e");
    }
    });
  }

}