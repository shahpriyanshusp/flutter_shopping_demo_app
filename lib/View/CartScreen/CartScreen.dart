import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shopping_demo_app/config/Helper/SizeConfige.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../Controller/BottomNavigationbar/BottomNavigationbarController.dart';
import '../../config/Utils/color.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  BBottomNavBarController cnt_bottom=Get.put(BBottomNavBarController());
  final cartscaffoldkey=GlobalKey<ScaffoldState>();
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.WHITE,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: AppColors.WHITE,
        title: Text("Cart Page",style: TextStyle(color: AppColors.BLACK),),

      ),
      body: Stack(
        children: [
          Center(child: Text("No Data Found"),),
          Positioned(
            bottom: 0,
            child: Container(
                height: 60.h,
                child: cnt_bottom.getNavBar(cartscaffoldkey)
            ),
            // child:cnt_btn.getNavBar(productscaffoldkey)
          )
        ],
      ),
    );
  }
}
