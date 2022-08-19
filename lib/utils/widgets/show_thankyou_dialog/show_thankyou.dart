import 'package:flutter/material.dart';
import 'package:get/get.dart';

showThankYou(context){
  showDialog(
    context: context, 
    barrierColor: Colors.white.withOpacity(0),
    builder: (context){
      final size = MediaQuery.of(context).size;
      return Center(
        child: SizedBox(
          height: 200,
          width: size.width*0.65,
          child: Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //Thank
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      "Thank You!",
                      style: Theme.of(context).textTheme.headline3,
                    ),
                  ),
                ),
                Text(
                  "Your order is successful.",
                  style: Theme.of(context).textTheme
                  .bodyText2?.copyWith(
                    color: Colors.black87,
                  )
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20,right: 10),
                  child: Text(
                    "We will notify you when admin confirm your order.",
                    style: Theme.of(context).textTheme
                    .bodyText2?.copyWith(
                      fontWeight: FontWeight.w100,
                      color: Colors.black,
                    )
                  ),
                ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                        ),
                      ),
                      onPressed: (){
                        Get.back();
                      }, 
                      child: SizedBox(
                        height: 50,
                        width: size.width*0.65,
                        child: Center(
                          child: Text(
                            "OK",
                            style: Theme.of(context).textTheme
                                    .bodyText2?.copyWith(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
              ],
            ),
          ),
        ),
      );
    },
    );
}