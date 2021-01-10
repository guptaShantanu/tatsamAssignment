import 'package:flutter/foundation.dart';
import 'package:tatsam_assignment/Utils/tatsam.dart';

class HomeModel{
  List<HomeData> countries = [];

  HomeModel.fromJson(json){
    json.forEach((key, value) {
      countries.add(HomeData(code: key,country: value['country'],region: value['region']));
    });
  }
}

class HomeData{
  String country;
  String region;
  String code;
  ValueNotifier<bool> isLiked = ValueNotifier<bool>(false);

  HomeData({this.country,this.region,this.code});

  void like(){
    print("Liked");
    this.isLiked.value = true;
    Tatsam.dbHelper.addWishlistItem(code, region, country);
  }
  void unlike(){
    print("Unliked");
    this.isLiked.value = false;
    Tatsam.dbHelper.removeWishlistItem(code);
  }
}