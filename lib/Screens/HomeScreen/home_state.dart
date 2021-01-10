import 'package:equatable/equatable.dart';
import 'package:tatsam_assignment/Screens/HomeScreen/Models/home_model.dart';

abstract class HomeState extends Equatable{
  HomeState getStateCopy();
}


class HomeLoadingState extends HomeState{
  String loadingMessage;
  HomeLoadingState(this.loadingMessage);

  @override
  HomeState getStateCopy() {
    // TODO: implement getStateCopy
    throw HomeLoadingState(loadingMessage);
  }

  @override
  // TODO: implement props
  List<Object> get props => [loadingMessage];

}


class HomeLoadedState extends HomeState{
  HomeModel list;
  HomeLoadedState({this.list});
  @override
  HomeState getStateCopy() {
    // TODO: implement getStateCopy
    throw HomeLoadedState();
  }

  @override
  // TODO: implement props
  List<Object> get props => [list];

}



class HomeErrorState extends HomeState{
  String errorMessage;

  HomeErrorState({this.errorMessage});
  @override
  HomeState getStateCopy() {
    // TODO: implement getStateCopy
    throw HomeErrorState();
  }

  @override
  // TODO: implement props
  List<Object> get props => [errorMessage];

}