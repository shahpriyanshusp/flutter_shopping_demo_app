import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shopping_demo_app/config/Helper/SizeConfige.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../Controller/BottomNavigationbar/BottomNavigationbarController.dart';
import '../../config/Utils/color.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  BBottomNavBarController cnt_bottom=Get.put(BBottomNavBarController());
  final accountscaffoldkey=GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.WHITE,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: AppColors.WHITE,
        title: Text("Account Page",style: TextStyle(color: AppColors.BLACK),),

      ),
      body: Stack(
        children: [
          Center(child: Text("No Data Found"),),
          Positioned(
            bottom: 0,
            child: Container(
                height: 60.h,
                child: cnt_bottom.getNavBar(accountscaffoldkey)
            ),
            // child:cnt_btn.getNavBar(productscaffoldkey)
          )
        ],
      ),
    );
  }
}
