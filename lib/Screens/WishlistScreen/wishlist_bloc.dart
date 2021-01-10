import 'package:bloc/bloc.dart';
import 'package:tatsam_assignment/Screens/WishlistScreen/Models/WishlistModel.dart';
import 'package:tatsam_assignment/Screens/WishlistScreen/wishlist_event.dart';
import 'package:tatsam_assignment/Screens/WishlistScreen/wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent,WishlistState>{

  WishlistModel countryList;
  WishlistBloc(WishlistState initialState) : super(initialState);

  WishlistState get initialState => new WishlistLoadingState();

  @override
  Stream<WishlistState> mapEventToState(WishlistEvent event)async* {
    try{
      yield WishlistLoadingState();
      yield await event.apply(currentState: null,bloc: this);
    }catch(e){
      yield WishlistErrorState(error: e.toString());
    }
  }

}