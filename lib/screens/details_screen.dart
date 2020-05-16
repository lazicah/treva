import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:treva/components/planet_row.dart';
import 'package:treva/models/planet_model.dart';

class DetailsScreen extends StatelessWidget {
  static const String id = 'details_screen';

  Container _getGradient() {
    return Container(
      margin: EdgeInsets.only(top: 190.0),
      height: 110,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: <Color>[Color(0x00736AB7), Color(0xFF736AB7)],
          stops: [0.0, 0.9],
          begin: FractionalOffset(0.0, 0.0),
          end: FractionalOffset(0.0, 1.0),
        ),
      ),
    );
  }

  Container _getToolbar(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: BackButton(
        color: Colors.white,
      ),
    );
  }

  Widget _getContent(Planet planet) {
    final _overviewTitle = "Overview".toUpperCase();
    return ListView(
      padding: EdgeInsets.fromLTRB(0.0, 72.0, 0.0, 32.0),
      children: <Widget>[
        PlanetSummary(
          planet: planet,
          isHorizontal: false,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                _overviewTitle,
                style: headerTextStyle,
              ),
              Separator(),
              Text(
                planet.description,
                style: subHeaderTextStyle.copyWith(fontSize: 18),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final Planet planet = ModalRoute.of(context).settings.arguments;
    return Scaffold(
        body: Container(
      color: new Color(0xFF736AB7),
      constraints: BoxConstraints.expand(),
      child: Stack(
        children: <Widget>[
          Container(
            constraints: BoxConstraints.expand(height: 300.0),
            child: Image.network(
              planet.picture,
              fit: BoxFit.cover,
              height: 300.0,
            ),
          ),
          _getGradient(),
          _getContent(planet),
          _getToolbar(context),
        ],
      ),
    ));
  }
}
