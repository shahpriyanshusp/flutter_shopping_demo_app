import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shopping_demo_app/config/Helper/SizeConfige.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../Controller/ProductController/AddProductController.dart';
import '../../Widget/customtextfield.dart';
import '../../config/Utils/color.dart';
import '../../config/Utils/images.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({Key? key}) : super(key: key);

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  AddProductController cnt_add=Get.put(AddProductController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.WHITE,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 12.0),
          child: GestureDetector(
            onTap: (){
              Get.back();
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.GREY),
                color: AppColors.WHITE
              ),
              child: Icon(Icons.arrow_back_ios_rounded,color: AppColors.BLACK,size: 17,),
            ),
          ),
        ),
        backgroundColor: AppColors.WHITE,
        title: Text("Add Products",style: TextStyle(color: AppColors.BLACK),),

      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding:  EdgeInsets.symmetric(vertical: 8.h,horizontal: 20.w),
            child: Obx(()=> Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Row(
                    children: [
                      Container(
                        height: 70.h,
                        width: 75.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.grey.withOpacity(0.2)
                        ),
                        child: DottedBorder(
                            radius: Radius.circular(12),
                            borderType: BorderType.RRect,
                            // dashPattern: [10, 10],
                            color: Colors.grey.withOpacity(0.4),
                            strokeWidth: 2,
                            child:   Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(Icons.add,color: AppColors.GREY.withOpacity(0.8),),
                                  Text("Add",style: TextStyle(color: AppColors.GREY.withOpacity(0.8)),)
                                ],
                              ),
                            )
                        ),
                      ),

                      Flexible(
                        child: Container(
                          height: 70.h,
                          child: ListView.builder(
                              itemCount: 2,
                              physics: BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemBuilder: (context,index){
                            return Padding(
                              padding: const EdgeInsets.only(left: 12.0),
                              child: Container(
                                height: 70.h,
                                width: 75.w,
                                clipBehavior: Clip.hardEdge,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: Colors.grey.withOpacity(0.2)
                                ),
                                child: Image.asset(Product_Demo_Img,fit: BoxFit.cover,)
                              ),
                            );
                          }),
                        ),
                      )


                    ],
                  ),
                ),
                SizedBox(height: 10,),
                customtext(cnt_add.txt_title,"Product title"),
                customtext(cnt_add.txt_categories,"Select Categories",suffixicon: true),
                Row(children: [
                  Expanded(child: customtext(cnt_add.txt_title,"Old Price")),
                  Expanded(child: customtext(cnt_add.txt_categories,"New Price")),
                ],),
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Variations",style: TextStyle(color: AppColors.BLACK,fontWeight:FontWeight.w600,fontSize: 16),),
                      GestureDetector(
                          onTap: (){
                            cnt_add.variationlist.add("");
                            cnt_add.variationlist.refresh();
                          },
                          child: Icon(Icons.add))
                    ],
                  ),
                ),
                SizedBox(height: 10,),

                ListView.builder(
                  itemCount: cnt_add.variationlist.length+1,
                  shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context,index){
                    return variationWidget();
                    }),
                customtext(cnt_add.txt_shortdesription,"Short Description"),
                 customtext(cnt_add.txt_longdescreption,"Description",maxlines: 5),

                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Prepration Time",style: TextStyle(color: AppColors.BLACK,fontWeight:FontWeight.w600,fontSize: 16),),

                    ],
                  ),
                ),
                SizedBox(height: 10,),
                customtext(cnt_add.txt_time,"Time"),
                Row(children: [
                  Expanded(child: customtext(cnt_add.txt_minut,"M",suffixicon: true)),
                  Expanded(child: customtext(cnt_add.txt_houre,"H",suffixicon: true)),
                  Expanded(child: customtext(cnt_add.txt_days,"D",suffixicon: true)),
                ],),
                customtext(cnt_add.txt_videolink,"Video Link"),

                SizedBox(height: 30,),
                Row(
                  children: [

                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: GestureDetector(
                          onTap: (){
                            Get.back();
                          },
                          child: Container(
                            height: 50.h,
                            decoration: BoxDecoration(
                              color: AppColors.Red.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: Colors.red)
                            ),
                            child: Center(child: Text("Cancel",style: TextStyle(color: Colors.red),)),

                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: GestureDetector(
                          onTap: (){
                            Get.back();
                          },
                          child: Container(
                          height: 50.h,
                            decoration: BoxDecoration(
                              color: AppColors.Green,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Center(child:Text("Add",style: TextStyle(color: Colors.white),)),

                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),)
          ),
        ),
      ),


    );
  }

  Widget variationWidget(){
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0,right: 8.0,left: 8.0),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.GREY.withOpacity(0.2),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.grey.withOpacity(0.2))
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
              crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text("size",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 16),),
                        ),
                        customtext(cnt_add.txt_size,"65")

                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text("Unit",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 16),),
                        ),
                        customtext(cnt_add.txt_unit,"Unit",suffixicon: true)

                      ],
                    ),
                  ),
                ],
              ),
              Row(
              crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text("color",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 16),),
                        ),
                        customtext(cnt_add.txt_size,"Black",suffixicon: true)

                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text("Price",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 16),),
                        ),
                        customtext(cnt_add.txt_price,"UGX 4000.00")

                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }



}
