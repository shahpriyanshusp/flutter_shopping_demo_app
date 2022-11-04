import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shopping_demo_app/View/AccountScreen/AccountScreen.dart';
import 'package:flutter_shopping_demo_app/View/CartScreen/CartScreen.dart';
import 'package:flutter_shopping_demo_app/View/ProductScreen/AddProductScreen.dart';
import 'package:flutter_shopping_demo_app/View/ProductScreen/ProductScreen.dart';
import 'package:flutter_shopping_demo_app/config/Helper/SizeConfige.dart';
import 'package:get/get.dart';

import '../../Model/BottomNavBarModelClass/BottomNavBarModel.dart';
import '../../View/HomeScreen/HomeScreen.dart';
import '../../config/Helper/custompainter.dart';
import '../../config/Utils/color.dart';

class BBottomNavBarController extends GetxController{
  RxList<BottomNavModel> bottomlist=RxList([]);
  RxInt selectedIndex = 0.obs;
  
  @override
  void onInit(){
    super.onInit();
    fetchdata();
  }
  
  fetchdata(){
    bottomlist.add(BottomNavModel(title: "home", icon:Icons.home_outlined , alias: "home"));
    bottomlist.add(BottomNavModel(title: "product", icon:Icons.card_travel_outlined , alias: "product"));
    bottomlist.add(BottomNavModel(title: "cart", icon:Icons.file_open_outlined , alias: "cart"));
    bottomlist.add(BottomNavModel(title: "account", icon:Icons.person_outline , alias: "account"));
    bottomlist.refresh();


  }
  getNavBar(GlobalKey<ScaffoldState> globalKey){
    return Container(
      height: 60.h,
      width: Get.width,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            height: 60.h,
            child: CustomPaint(
              size: Size(Get.width, 60),
              painter: NavBarClipper(),
            ),
          ),
          Positioned(
              top: -25,

              left: Get.width*0.28,
              child:GestureDetector(
                onTap: (){
                  selectedIndex.value=1;
                  selectedIndex.refresh();
                },
                child: Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                      color: AppColors.Green,
                      borderRadius: BorderRadius.circular(30)
                  ),
                  child: Icon(Icons.card_giftcard,size: 30,color: AppColors.WHITE,),

                ),
              ) ),
          Container(
            width: Get.width,
            child: ListView.builder(
                itemCount: bottomlist.length,
                scrollDirection: Axis.horizontal,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (_,index){
              return GestureDetector(
                onTap: (){
                menuclickhandler(bottomlist[index].alias.toString());
                },
                child: Container(
                  width: Get.width/4,
                  child: Column(
                    children: [
                      Icon(bottomlist[index].icon,color: index==1?Colors.transparent:Colors.black,size: 30,),
                      SizedBox(height: 10,),
                      Text(bottomlist[index].title.toString())
                    ],
                  ),
                ),
              );
            })
          ),



        ],
      ),
    );
  }

  menuclickhandler(String alias){
    switch(alias){
      case "home":
        selectedIndex.value=0;
        selectedIndex.refresh();
        Get.offAll(HomeScreen());
    break;
      case "product":
        selectedIndex.value=1;
        selectedIndex.refresh();
        Get.to(ProductScreen());
    break;
      case "cart":
        selectedIndex.value=2;
        selectedIndex.refresh();
        Get.to(CartScreen());
        break;

      case "account":
        selectedIndex.value=3;
        selectedIndex.refresh();
        Get.to(AccountScreen());
        break;
      default :

    selectedIndex.value=0;
    selectedIndex.refresh();
    Get.offAll(HomeScreen());

    break;

    }

  }
}
