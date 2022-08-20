import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:thukha/constant/constant.dart';
import 'package:thukha/constant/mock.dart';
import 'package:thukha/utils/routes/route_url.dart';

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
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  primary: false,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 0,
                    mainAxisSpacing: 0,
                    childAspectRatio: 1.2,
                    ), 
                  itemCount: shopList.length,
                  itemBuilder: (context,index){
                    final shop = shopList[index];
                    return SizedBox(
                      height: 140,
                      child:  Stack(
                          children: [
                            //image
                            Align(
                              alignment: Alignment.center,
                              child: InkWell(
                                splashColor: Colors.white.withOpacity(0),
                                borderRadius: const BorderRadius.all(
                                      Radius.circular(20.0)
                                    ),
                                onTap: () {
                                  Get.toNamed(
                                  orderDetailScreen,
                                  arguments: [
                                    shop.name,
                                    mockOrderList,
                                  ],
                                );
                                debugPrint("Go to $orderDetailScreen");
                                },
                                child: Card(
                                  child: ClipRRect(
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(20.0)
                                    ),
                                    child: CachedNetworkImage(
                                              progressIndicatorBuilder: (context, url, status) {
                                                return Shimmer.fromColors(
                                                  // ignore: sort_child_properties_last
                                                  child:  Container(
                                                    height: 140,
                                                    decoration: const BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius: BorderRadius.all(
                                                        Radius.circular(20)
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
                                              imageUrl: shop.image,
                                              fit: BoxFit.contain,
                                              height: 140,
                                            ),
                                  ),
                                ),
                              ),
                            ),
                            //Order Count
                            Positioned(
                              top: 0,
                              right: 0,
                              child: CircleAvatar(
                                radius: 20,
                                backgroundColor: Colors.grey.shade300,
                                child: Text(
                                  "59",
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
            const SizedBox(height: 15,),
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

            const SizedBox(height: 15,),
            //Manage Stock Table
            Text(
                "Manage stock table",
                style: Theme.of(context).textTheme.headline3,
              ),
            SizedBox(
              height: 85,
              child: Card(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero,
                ),
                child: InkWell(
                  onTap: () => Get.toNamed(manageStockStableScreen),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //Table Image
                         Image.asset(
                            stockTable,
                            width: 85,
                            fit: BoxFit.fill,
                          ),
                        //Table Image
                         Image.asset(
                            stockTable,
                            width: 85,
                            fit: BoxFit.fill,
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