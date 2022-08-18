import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shimmer/shimmer.dart';
import 'package:thukha/constant/constant.dart';
import 'package:thukha/constant/mock.dart';

import '../../utils/theme/app_theme.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 10,right: 10,top: 20),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Orders
              Text(
                "Orders from all shops",
                style: Theme.of(context).textTheme.headline3,
              ),
              SizedBox(
                height: (shopList.length/2) * 210,
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2), 
                  itemCount: shopList.length,
                  itemBuilder: (context,index){
                    final shop = shopList[index];
                    return SizedBox(
                      child: Stack(
                        children: [
                          //image
                          Align(
                            alignment: Alignment.center,
                            child: Card(
                              child: ClipRRect(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(20.0)
                                ),
                                child: CachedNetworkImage(
                                          progressIndicatorBuilder: (context, url, status) {
                                            return Shimmer.fromColors(
                                              child:  Container(
                                                color: Colors.white,
                                              ),
                                              baseColor: Colors.grey.shade300,
                                              highlightColor: Colors.white,
                                            );
                                          },
                                          errorWidget: (context, url, whatever) {
                                            return const Text("Image not available");
                                          },
                                          imageUrl: shop.image,
                                          fit: BoxFit.contain,
                                          height: 150,
                                        ),
                              ),
                            ),
                          ),
                          //Order Count
                          Positioned(
                            top: 0,
                            right: 0,
                            child: CircleAvatar(
                              radius: 25,
                              backgroundColor: Colors.grey,
                              child: Text(
                                "5",
                                style: Theme.of(context).textTheme.bodyText2,
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
            //View Order Table
            Text(
                "View ordering table",
                style: Theme.of(context).textTheme.headline3,
              ),
            SizedBox(
              height: 85,
              child: Card(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero,
                ),
                child: InkWell(
                  onTap: (){
                    //TODO Do Something
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //Table Image
                        Expanded(
                          child: Image.asset(
                            tableImage,
                            fit: BoxFit.fill,
                          ),
                        ),
                        //Icon Button
                        const Icon(FontAwesomeIcons.circleArrowRight),
                      ],
                    ),
                  ),
                ),
              )
            ),
            ],
          ),
      ),
    );
  }
}