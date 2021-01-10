import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tatsam_assignment/Screens/DeveloperScreen/developer_screen.dart';
import 'package:tatsam_assignment/Screens/HomeScreen/home_screen.dart';
import 'package:tatsam_assignment/Screens/WishlistScreen/wishlist_page.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Tatsam'),
        leading: Builder(
          builder: (context)=>IconButton(
            icon: Icon(Icons.menu,color: Colors.black,),
            onPressed: (){
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            Expanded(flex: 3,child: Container(
              color: Colors.black,
            ),),
            Expanded(flex: 6,child: Container(
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(CupertinoIcons.heart_solid),
                    title: Text('Wishlist'),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return WishlistPage();
                      }));
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.code),
                    title: Text('Developed By'),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return DeveloperScreen();
                      }));
                    },
                  ),
                ],
              ),
            ),)
          ],
        ),
      ),
      body: HomeScreen(),
    );
  }
}
