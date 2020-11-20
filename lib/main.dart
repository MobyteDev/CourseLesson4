import 'package:flutter/material.dart';

import 'broadcast_page.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
     
    return MaterialApp(
      title: 'CryptoTrecker',
      theme:  ThemeData(
            textTheme: TextTheme(
            headline1: TextStyle(
              fontSize: 25,
              color: Colors.white,
              fontWeight: FontWeight.w400,
            )
          ),
          primaryColor: Color(0xffBB86FC),
          backgroundColor: Color(0xff121212),
          accentColor: Color(0xff03DAC6),
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
      home: BroadcastPage(),
    );
  }
}
