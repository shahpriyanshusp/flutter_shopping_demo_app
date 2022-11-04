import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddProductController extends GetxController{
  TextEditingController txt_title=TextEditingController();
  TextEditingController txt_categories=TextEditingController();
  TextEditingController txt_oldprice=TextEditingController();
  TextEditingController txt_newprice=TextEditingController();
  TextEditingController txt_size=TextEditingController();
  TextEditingController txt_unit=TextEditingController();
  TextEditingController txt_color=TextEditingController();
  TextEditingController txt_price=TextEditingController();
  TextEditingController txt_shortdesription=TextEditingController();
  TextEditingController txt_longdescreption=TextEditingController();
  TextEditingController txt_time=TextEditingController();
  TextEditingController txt_minut=TextEditingController();
  TextEditingController txt_houre=TextEditingController();
  TextEditingController txt_days=TextEditingController();
  TextEditingController txt_videolink=TextEditingController();

  RxList<String> variationlist=RxList([]);

}