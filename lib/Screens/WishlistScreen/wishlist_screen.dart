import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tatsam_assignment/Dialogs/error_dialog.dart';
import 'package:tatsam_assignment/Screens/WishlistScreen/Models/WishlistModel.dart';
import 'package:tatsam_assignment/Screens/WishlistScreen/Widgets/country_tile2.dart';
import 'package:tatsam_assignment/Screens/WishlistScreen/wishlist_bloc.dart';
import 'package:tatsam_assignment/Screens/WishlistScreen/wishlist_event.dart';
import 'package:tatsam_assignment/Screens/WishlistScreen/wishlist_state.dart';

class WishlistScreen extends StatefulWidget {
  @override
  _WishlistScreenState createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  WishlistBloc bloc;

  @override
  void initState() {
    bloc = WishlistBloc(WishlistLoadingState());
    bloc.add(WishlistLoadEvent());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: BlocBuilder<WishlistBloc,WishlistState>(
        cubit: bloc,
        builder: (context,state){
          print("The incoming state $state");
          if(state is WishlistLoadedState){
            List<WishlistData> list = [];
            bloc.countryList.list.forEach((key, value) {
              list.add(WishlistData(
                country: value.country,
                code: value.code,
                region: value.region
              ));
            });
            return ListView.builder(
              itemCount: list.length,
              itemBuilder: (context,index){
                return CountryTile2(data: list[index],);
            },
            );
          }
          if(state is WishlistErrorState){
            return Center(
              child: ErrorDialog(),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
