import 'package:flutter/material.dart';
import 'package:tatsam_assignment/Database/database_helper.dart';
import 'package:tatsam_assignment/Screens/SplashScreen/splash_screen.dart';
import 'package:tatsam_assignment/Utils/tatsam.dart';

import 'Service/NetworkService/network_service.dart';

void main(){
  WidgetsFlutterBinding.ensureInitialized();
  Tatsam.networkService = NetworkService();
  Tatsam.dbHelper = DatabaseHelper();
  runApp(TatsamApp());
}

class TatsamApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen()
    );
  }
}
