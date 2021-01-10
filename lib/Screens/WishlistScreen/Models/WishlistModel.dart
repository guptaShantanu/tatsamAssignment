class WishlistModel{
  Map<String,WishlistData> list= {};
  WishlistModel.fromJson(json){
    for(int i =0;i<json.length;i++){
      print(json[i]);
      list[json[i]['code']] = WishlistData(country: json[i]['country'],
          code: json[i]['code'],
          region:json[i]['region']);
    }
  }
}

class WishlistData{
  String country;
  String region;
  String code;

  WishlistData({this.country,this.region,this.code});
}


