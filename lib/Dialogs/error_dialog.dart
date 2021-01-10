import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ErrorDialog extends StatelessWidget {
  Function onPress;
  ErrorDialog({this.onPress});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.0,
      margin: EdgeInsets.all(10.0),
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 10.0,
            offset: Offset(5,10)
          )
        ]
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text('Oh no!',
          style: TextStyle(
            fontSize: 30.0,
          ),),
          Text('Something went wrong'),
          FlatButton(
            color: Colors.black,
            child: Text('Try again',style: TextStyle(color: Colors.white),),
            onPressed: onPress,
          )
        ],
      ),
    );
  }
}
