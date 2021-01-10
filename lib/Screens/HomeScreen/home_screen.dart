import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tatsam_assignment/Dialogs/error_dialog.dart';
import 'package:tatsam_assignment/Screens/HomeScreen/Widgets/country_tile.dart';
import 'package:tatsam_assignment/Screens/HomeScreen/Widgets/page_traveller.dart';
import 'package:tatsam_assignment/Screens/HomeScreen/home_bloc.dart';
import 'package:tatsam_assignment/Screens/HomeScreen/home_event.dart';
import 'package:tatsam_assignment/Screens/HomeScreen/home_state.dart';
import 'package:connectivity/connectivity.dart';
import 'dart:io';
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeBloc bloc;
  ScrollController controller;
  var subscription;

  @override
  void initState() {
    bloc = HomeBloc(HomeLoadingState(""));
    controller = new ScrollController();
    checkInternetConnectivity();
    bloc.add(HomeLoadEvent());
    super.initState();
  }

  void checkInternetConnectivity()async{
      try{
        var result = await InternetAddress.lookup('google.com');
        if(result.isNotEmpty && result[0].rawAddress.isNotEmpty){
          Scaffold.of(context).showSnackBar(SnackBar(
            content: Text('Internet resumed'),
            duration: Duration(seconds: 5),
            backgroundColor: Colors.green,
          ));
        }
      }on SocketException catch(e) {
        Scaffold.of(context).showSnackBar(SnackBar(
          content: Text('Please check your network connectivity'),
          duration: Duration(seconds: 5),
          backgroundColor: Colors.red,
        ));
      }
  }

  @override
  void dispose() {
    print("Home screen disposed");
    subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: BlocBuilder<HomeBloc,HomeState>(
        cubit: bloc,
        builder: (BuildContext context, HomeState state){
          if(state is HomeErrorState){
            return Center(
              child: ErrorDialog(
                onPress: (){
                  checkInternetConnectivity();
                  bloc.add(HomeLoadEvent());
                },
              ),
            );
          }
          if(state is HomeLoadedState){
            return ListView.builder(
              itemCount: bloc.endIndex-bloc.startIndex+1,
              itemBuilder: (context,index){
                if(index==bloc.endIndex-bloc.startIndex){
                  return PageTraveller(bloc: bloc,);
                }
                return CountryTile(
                  data: state.list.countries[bloc.startIndex+index],
                );
              },
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
