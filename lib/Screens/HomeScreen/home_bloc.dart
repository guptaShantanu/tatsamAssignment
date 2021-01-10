

import 'package:bloc/bloc.dart';
import 'package:tatsam_assignment/Screens/HomeScreen/home_event.dart';
import 'package:tatsam_assignment/Screens/HomeScreen/home_state.dart';

import 'Models/home_model.dart';

class HomeBloc extends Bloc<HomeEvent,HomeState>{
  int startIndex = 0;
  int endIndex = 10;
  HomeModel countryList;
  HomeBloc(HomeState initialState) : super(initialState);

  HomeState get initialState => new HomeLoadingState('Data is loading from network');

  @override
  Stream<HomeState> mapEventToState(HomeEvent event)async* {
    try{
      yield HomeLoadingState('Loading');
      yield await event.apply(currentState: null,bloc: this);
    }catch(e){
      yield HomeErrorState(errorMessage: e.toString());
    }
  }

}