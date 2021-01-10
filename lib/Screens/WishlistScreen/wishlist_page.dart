import 'package:flutter/material.dart';
import 'package:tatsam_assignment/Screens/WishlistScreen/wishlist_screen.dart';

class WishlistPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wishlist'),
        backgroundColor: Colors.black,
      ),
      body: WishlistScreen(),
    );
  }
}
