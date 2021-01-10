import 'dart:convert';

import 'package:http/http.dart';
import 'package:tatsam_assignment/Screens/HomeScreen/Models/home_model.dart';

class NetworkService{

  Future<HomeModel> getCountries()async{

    HomeModel list;

    String url = "https://api.first.org/data/v1/countries";

    var response = await get(url);
    var decodedResponse  = jsonDecode(response.body);

    // print("NetworkService : getCountries $decodedResponse");

    if(decodedResponse['status-code']==200){
      list = HomeModel.fromJson(decodedResponse['data']);
    }

    return list;

  }
}
