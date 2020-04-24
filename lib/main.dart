import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sir_giles_brewing/screens/main_screen.dart';
import 'package:sir_giles_brewing/services/globals.dart';
import 'package:sir_giles_brewing/services/models.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StreamProvider<List<Beer>>.value(value: Global.beerCollection.streamData()),
      ],
      child: MaterialApp(
        title: 'Sir Giles Brewing Company',
        initialRoute: MainScreen.id,
        routes: {
          MainScreen.id: (context) => MainScreen(),
        },
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            color: Colors.blue[900],
          ),
        ),
      ),
    );
  }
}
