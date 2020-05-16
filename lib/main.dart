import 'package:flutter/material.dart';
import 'package:treva/screens/details_screen.dart';
import 'package:treva/screens/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      initialRoute: HomePage.id,
      routes: {
        HomePage.id: (context) => HomePage(),
        DetailsScreen.id: (context) => DetailsScreen(),
      },
    );
  }
}
