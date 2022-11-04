import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shopping_demo_app/Controller/BottomNavigationbar/BottomNavigationbarController.dart';
import 'package:flutter_shopping_demo_app/config/Helper/SizeConfige.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../config/Utils/color.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  BBottomNavBarController cnt_bottom=Get.put(BBottomNavBarController());
  final homescaffoldkey=GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.WHITE,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: AppColors.WHITE,
        title: Text("Home Page",style: TextStyle(color: AppColors.BLACK),),

      ),
      body: Stack(
        children: [
          Center(child: Text("No Data Found"),),
          Positioned(
            bottom: 0,
            child: Container(
                height: 60.h,
                child: cnt_bottom.getNavBar(homescaffoldkey)
            ),
            // child:cnt_btn.getNavBar(productscaffoldkey)
          )
        ],
      ),
    );
  }
}
