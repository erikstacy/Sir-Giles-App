import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {

  static String id = 'main_screen';

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sir Giles Brewing'),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        child: Text('Beer'),
      ),
    );
  }
}