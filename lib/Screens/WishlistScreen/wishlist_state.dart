import 'package:equatable/equatable.dart';
import 'package:tatsam_assignment/Screens/WishlistScreen/Models/WishlistModel.dart';

abstract class WishlistState extends Equatable{
  WishlistState getStateCopy();
}

class WishlistLoadingState extends WishlistState{


  @override
  WishlistState getStateCopy() {
    // TODO: implement getStateCopy
    throw WishlistLoadingState();
  }

  @override
  // TODO: implement props
  List<Object> get props => [];

}

class WishlistLoadedState extends WishlistState{

  WishlistModel list;
  WishlistLoadedState({this.list});

  @override
  WishlistState getStateCopy() {
    // TODO: implement getStateCopy
    throw WishlistLoadedState();
  }

  @override
  // TODO: implement props
  List<Object> get props => [list];

}

class WishlistErrorState extends WishlistState{
  String error;
  WishlistErrorState({this.error});
  @override
  WishlistState getStateCopy() {
    // TODO: implement getStateCopy
    throw WishlistErrorState();
  }

  @override
  // TODO: implement props
  List<Object> get props => [error];

}