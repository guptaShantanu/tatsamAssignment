import 'package:flutter/material.dart';
import 'package:tatsam_assignment/Screens/HomeScreen/home_page.dart';
import 'package:tatsam_assignment/Screens/WishlistScreen/wishlist_page.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2),(){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
    });
    return Scaffold(
      body: Center(
        child: Text('Tatsam assignment'),
      ),
    );
  }
}
