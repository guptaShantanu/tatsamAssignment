import 'package:tatsam_assignment/Screens/WishlistScreen/Models/WishlistModel.dart';
import 'package:tatsam_assignment/Screens/WishlistScreen/wishlist_bloc.dart';
import 'package:tatsam_assignment/Screens/WishlistScreen/wishlist_state.dart';
import 'package:tatsam_assignment/Utils/tatsam.dart';

abstract class WishlistEvent{
  Future<WishlistState> apply({WishlistState currentState, WishlistBloc bloc});
}

class WishlistLoadEvent extends WishlistEvent{

  @override
  Future<WishlistState> apply({WishlistState currentState, WishlistBloc bloc})async {
    List data = await  Tatsam.dbHelper.getWishlistItem();
    print("LOad event $data");
      bloc.countryList = WishlistModel.fromJson(data);
      return WishlistLoadedState(list: bloc.countryList);
  }

}

