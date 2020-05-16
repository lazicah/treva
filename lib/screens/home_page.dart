import 'package:flutter/material.dart';
import 'package:treva/components/gradient_appbar.dart';
import 'package:treva/components/homepage_body.dart';

class HomePage extends StatelessWidget {
  static const String id = 'home_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          GradientAppBar(title: 'treva'),
          HomePageBody(),
        ],
      ),
    );
  }
}
