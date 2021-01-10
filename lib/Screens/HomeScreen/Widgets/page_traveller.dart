import 'package:flutter/material.dart';
import 'package:tatsam_assignment/Screens/HomeScreen/home_bloc.dart';
import 'package:tatsam_assignment/Screens/HomeScreen/home_event.dart';

class PageTraveller extends StatelessWidget {
  HomeBloc bloc;
  ScrollController controller;
  PageTraveller({this.bloc,this.controller});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 50.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FlatButton(onPressed: () {
            controller.jumpTo(0.0);
            if(bloc.startIndex!=0)
            bloc.add(PagePrevEvent());
          },
              child: Text('Prev',
              style: TextStyle(
                color: bloc.startIndex<=0?Colors.grey:Colors.blue
              ),),
          color: Colors.black.withOpacity(0.2),),
          SizedBox(width:10.0),
          FlatButton(onPressed: () {
            controller.jumpTo(0.0);
            if(bloc.endIndex<bloc.countryList.countries.length-1){
              bloc.add(PageNextEvent());
            }
          },
              child: Text('Next',
              style: TextStyle(
                color: bloc.endIndex!=bloc.countryList.countries.length-1?Colors.blue:Colors.grey
              ),),
            color: Colors.black.withOpacity(0.2),),
        ],
      ),
    );
  }
}
