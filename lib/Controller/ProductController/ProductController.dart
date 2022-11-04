

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../Model/ProductListModel/ProductListModel.dart';
import '../../config/Utils/images.dart';

class ProductController extends GetxController{
TextEditingController txt_search=TextEditingController();
RxList<ProductListModel> productlist=RxList([]);
RxList<ProductListModel> productlistforsearch=RxList([]);
RxList<ProductListModel> searchlist=RxList([]);


  @override
  void onInit(){
   // TODO: implement onInit
    super.onInit();
    adddata();

  }
  
  adddata(){
    productlist.clear();
    productlist.refresh();
    
    productlist.add(ProductListModel(ProductDescription: "Versatile 28G Potters Clay Matt Roffing Sheet Per Meteree", image: Product_Demo_Img, newprice: "UGX 1500 ", oldprice: "UGX 1500"));
    productlist.add(ProductListModel(ProductDescription: "Abc product Versatile 28G Potters Clay Matt Roffing Sheet Per Meteree", image: Product_Demo_Img, newprice: "UGX 1600 ", oldprice: "UGX 1500"));
    productlist.add(ProductListModel(ProductDescription: "Versatile 28G Potters Clay Matt Roffing Sheet Per Meteree", image: Product_Demo_Img, newprice: "UGX 1700 ", oldprice: "UGX 1500"));
    productlist.add(ProductListModel(ProductDescription: "Versatile 28G Potters Clay Matt Roffing Sheet Per Meteree", image: Product_Demo_Img, newprice: "UGX 1800 ", oldprice: "UGX 1500"));
    productlist.add(ProductListModel(ProductDescription: "Versatile 28G Potters Clay Matt Roffing Sheet Per Meteree", image: Product_Demo_Img, newprice: "UGX 1900 ", oldprice: "UGX 1500"));
    productlist.add(ProductListModel(ProductDescription: "Versatile 28G Potters Clay Matt Roffing Sheet Per Meteree", image: Product_Demo_Img, newprice: "UGX 2000 ", oldprice: "UGX 1500"));
    productlist.add(ProductListModel(ProductDescription: "Versatile 28G Potters Clay Matt Roffing Sheet Per Meteree", image: Product_Demo_Img, newprice: "UGX 2100 ", oldprice: "UGX 1500"));
    productlist.add(ProductListModel(ProductDescription: "Versatile 28G Potters Clay Matt Roffing Sheet Per Meteree", image: Product_Demo_Img, newprice: "UGX 2200 ", oldprice: "UGX 1500"));
    productlist.add(ProductListModel(ProductDescription: "Versatile 28G Potters Clay Matt Roffing Sheet Per Meteree", image: Product_Demo_Img, newprice: "UGX 2300 ", oldprice: "UGX 1500"));
    productlist.add(ProductListModel(ProductDescription: "Versatile 28G Potters Clay Matt Roffing Sheet Per Meteree", image: Product_Demo_Img, newprice: "UGX 2400 ", oldprice: "UGX 1500"));


    productlist.refresh();

  }


onSearchTextChanged(String text,RxList<ProductListModel> list) async {
    if(list.length>0 && productlistforsearch.length<0){
      productlistforsearch.value=list;
      productlistforsearch.refresh();
    }
    else{
      productlist.value=productlistforsearch;
      productlist.refresh();
    }
    productlist=list;
    searchlist.clear();
  if (text.isEmpty) {
    adddata();
    return;
  }


  productlist.forEach((element) {
    if (element.ProductDescription!.toLowerCase().contains(text.toLowerCase()))
    {
      print("inside element"+element.ProductDescription.toString());
      searchlist.add(element);
    }

  });
  print(searchlist.length.toString()+"this is length");

  if(searchlist.length>0){
    print(searchlist[0].ProductDescription);
    print("reah onnn the section");
    productlist.clear();
    productlist=searchlist;
    productlist.refresh();
  }




}
  
}