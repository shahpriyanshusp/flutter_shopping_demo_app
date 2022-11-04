import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../config/Utils/color.dart';

Widget customtext(TextEditingController controller,String hinttext,{bool suffixicon=false,int maxlines=1}){
  return  Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 8.0),
    child: TextFormField(
      controller: controller,
      decoration: InputDecoration(
        suffixIcon: suffixicon==true?  Icon(Icons.arrow_drop_down_outlined,color: AppColors.GREY,):SizedBox(),
        fillColor: AppColors.GREY.withOpacity(0.1),
        filled: true,
        hintText: hinttext,
        hintStyle: TextStyle(color: AppColors.GREY),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15),borderSide: BorderSide(color:AppColors.GREY.withOpacity(0.2) )),
        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15),borderSide: BorderSide(color:AppColors.GREY.withOpacity(0.2) )),
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15),borderSide: BorderSide(color:AppColors.GREY.withOpacity(0.2) )),
        disabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15),borderSide: BorderSide(color:AppColors.GREY.withOpacity(0.2) )),
        focusColor: Colors.grey.withOpacity(0.1),

      ),
      cursorColor: AppColors.BLACK,
      maxLines: maxlines,
    ),
  );
}