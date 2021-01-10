import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tatsam_assignment/Screens/HomeScreen/Models/home_model.dart';


class CountryTile extends StatelessWidget{
  HomeData data;
  CountryTile({this.data});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.0,
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey
        )
      ),
      child: Row(
        children: [
          Expanded(flex:8,child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(data.code,
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w900,
                ),),
                Text(data.country,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 20.0,
                    ),softWrap: true,),
                Text(data.region)
              ],
            ),
          ),),
          Expanded(flex:1,child: Container(
            padding: EdgeInsets.symmetric(vertical: 10.0),
            alignment: Alignment.topCenter,
              child: ValueListenableBuilder(
                valueListenable: data.isLiked,
                builder: (context,bool value,child){

                  return IconButton(
                    onPressed: (){
                      if(!value) {
                        data.like();
                      }else{
                        data.unlike();
                      }
                    },
                    icon: Icon(value?CupertinoIcons.heart_solid:CupertinoIcons.heart,
                      color: Colors.red,),
                  );
                },
            )
          ),)
        ],
      )
    );
  }
}
