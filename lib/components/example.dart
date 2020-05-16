import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  final String firstText;

  MyWidget(this.firstText);

  factory MyWidget.forDesignTime() {
    return new MyWidget('AA');
  }

  @override
  Widget build(BuildContext context) {
    return new Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        buildText(firstText),
        buildText('BBBB'),
        buildText('CCCCCC'),
        buildText('DDDDDDDD'),
      ],
    );
  }

  Text buildText(String text) {
    return new Text(text, style: const TextStyle(fontSize: 24.0));
  }
}
