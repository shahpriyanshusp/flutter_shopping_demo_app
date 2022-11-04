import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shopping_demo_app/Controller/BottomNavigationbar/BottomNavigationbarController.dart';
import 'package:flutter_shopping_demo_app/Controller/ProductController/ProductController.dart';
import 'package:flutter_shopping_demo_app/View/ProductScreen/AddProductScreen.dart';
import 'package:flutter_shopping_demo_app/config/Helper/SizeConfige.dart';
import 'package:flutter_shopping_demo_app/config/Utils/color.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../config/Utils/images.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  ProductController cnt_prod=Get.put(ProductController());
  BBottomNavBarController cnt_btn=Get.put(BBottomNavBarController());
  final productscaffoldkey=GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.WHITE,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: AppColors.WHITE,
        title: Text("All Products",style: TextStyle(color: AppColors.BLACK),),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: GestureDetector(
              onTap: (){
                Get.to(AddProductScreen());
              },
              child: Row(
                children: [
                  Icon(Icons.add,color: AppColors.Green),
                  Text("ADD",style: TextStyle(color: AppColors.Green,fontWeight: FontWeight.w600),)
                ],
              ),
            ),
          )
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child:Padding(
            padding:  EdgeInsets.symmetric(vertical: 8.h,horizontal: 12.w),
            child: Obx(()=> Column(
              children: [
                SearchBox(),
                SizedBox(height: 15,),
             ListView.builder(
                  shrinkWrap: true,
                    itemCount: cnt_prod.productlist.length,
                    scrollDirection: Axis.vertical,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context,index){
                      return Obx(() =>
                        Padding(
                          padding: const EdgeInsets.only(bottom: 15.0),
                          child: ListItemDesign(index),
                        ));
                })

              ],
            ),)
          ),
        ),
      ),
      bottomNavigationBar:Container(
          height: 60.h,
          child: cnt_btn.getNavBar(productscaffoldkey)
      ) ,

    );
  }

  Widget SearchBox(){
    return  TextFormField(
      controller: cnt_prod.txt_search,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.search,color: AppColors.BLACK,),



        suffixIcon: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 5.w,vertical: 3.h),
          child: Container(

            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.w),
                color: AppColors.Green
            ),
            child: Icon(Icons.art_track,color:AppColors.WHITE),
          ),
        ),
        hintText: "Search Products..",
        hintStyle: TextStyle(color: AppColors.GREY),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
        focusColor: Colors.black,
      ),
      onChanged: (value) {
       cnt_prod. onSearchTextChanged(cnt_prod.txt_search.text,cnt_prod.productlist);

      },
      onFieldSubmitted: (value) {

        cnt_prod. onSearchTextChanged(cnt_prod.txt_search.text,cnt_prod.productlist);

        FocusScope.of(context).unfocus();
      },
      onEditingComplete: (){
        cnt_prod. onSearchTextChanged(cnt_prod.txt_search.text,cnt_prod.productlist);
        FocusScope.of(context).unfocus();
        // get_allProduct_list(_textsearch.text);
      },
      cursorColor: AppColors.BLACK,
    );
  }

  Widget ListItemDesign(int index){
    final obj=cnt_prod.productlist[index];
    return  Container(
      height: 100.h,
      width: Get.width,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: AppColors.GREY),
          color: AppColors.WHITE,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 110.h,
            width: 110.w,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                    child: Image.asset(obj.image.toString(),fit: BoxFit.cover),
                borderRadius:BorderRadius.circular(15),
                ),
              )),
          Expanded(
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(obj.ProductDescription.toString(),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: TextStyle(fontWeight: FontWeight.w600,color: AppColors.BLACK,fontSize: 15),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RichText(
                          text: TextSpan(
                            text: obj.newprice,
                            style: TextStyle(color: AppColors.BLACK,fontSize: 14),
                            children:  <TextSpan>[
                              TextSpan(text: obj.oldprice, style: TextStyle(fontWeight: FontWeight.w400,color: AppColors.GREY, decoration: TextDecoration.lineThrough,)),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: (){
                                Get.to(AddProductScreen());
                              },
                              child: Container(
                                height: 25,
                                width: 25,
                                decoration: BoxDecoration(
                                  color: AppColors.Green.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Center(child: Icon(Icons.edit,color: AppColors.Green,size: 18,)),

                              ),
                            ),
                            SizedBox(width: 7,),
                            GestureDetector(
                              onTap: (){
                                cnt_prod.productlist.removeAt(index);
                                cnt_prod.productlist.refresh();
                              },
                              child: Container(
                                height: 25,
                                width: 25,
                                decoration: BoxDecoration(
                                  color: AppColors.Red.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Center(child: Icon(Icons.block,color: AppColors.Red,size: 18,)),

                              ),
                            ),
                          ],
                        )

                      ],
                    )
                  ],
                ),
              ),
            )
        ],
      ),
    );
  }

}
