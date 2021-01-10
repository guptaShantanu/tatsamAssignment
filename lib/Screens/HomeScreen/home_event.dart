
import 'package:tatsam_assignment/Screens/HomeScreen/Models/home_model.dart';
import 'package:tatsam_assignment/Screens/HomeScreen/home_bloc.dart';
import 'package:tatsam_assignment/Screens/HomeScreen/home_state.dart';
import 'package:tatsam_assignment/Screens/WishlistScreen/Models/WishlistModel.dart';
import 'package:tatsam_assignment/Utils/tatsam.dart';

abstract class HomeEvent{
  Future<HomeState> apply({HomeState currentState, HomeBloc bloc});
}

class HomeLoadEvent extends HomeEvent{
  @override
  Future<HomeState> apply({HomeState currentState, HomeBloc bloc}) async{
    var saved = WishlistModel.fromJson(await Tatsam.dbHelper.getWishlistItem());
    HomeModel list = await Tatsam.networkService.getCountries();
    for(var i in list.countries){
      if(saved.list[i.code]!=null){
        i.isLiked.value = true;
      }
    }
    bloc.countryList = list;
    return HomeLoadedState(list: list);
  }

}

class PageNextEvent extends HomeEvent{
  @override
  Future<HomeState> apply({HomeState currentState, HomeBloc bloc}) async{
    print('${bloc.startIndex} ${bloc.endIndex} ${bloc.countryList.countries.length}');
    if(bloc.endIndex>=bloc.countryList.countries.length){

    }else{
      bloc.endIndex+=10;
      bloc.startIndex+=10;
    }
    if(bloc.endIndex>=bloc.countryList.countries.length){
      bloc.endIndex = bloc.countryList.countries.length-1;
      // bloc.startIndex = bloc.endIndex-5;
    }
    return await HomeLoadedState(list: bloc.countryList);
  }

}

class PagePrevEvent extends HomeEvent{
  @override
  Future<HomeState> apply({HomeState currentState, HomeBloc bloc}) async{
    if(bloc.startIndex<0){

    }else{
      bloc.endIndex-=10;
      bloc.startIndex-=10;
    }
    if(bloc.startIndex<0){
      bloc.endIndex+=10;
      bloc.startIndex+=10;
    }
    return await HomeLoadedState(list: bloc.countryList);
  }

}