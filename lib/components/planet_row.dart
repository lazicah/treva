import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:treva/models/planet_model.dart';
import 'package:treva/screens/details_screen.dart';

class PlanetSummary extends StatelessWidget {
  final Planet planet;
  final bool isHorizontal;

  PlanetSummary({this.planet, this.isHorizontal = true});

  PlanetSummary.vertical(this.planet) : isHorizontal = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isHorizontal
          ? () =>
              Navigator.pushNamed(context, DetailsScreen.id, arguments: planet)
          : null,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
        child: Stack(
          children: <Widget>[
            Container(
              height: isHorizontal ? 124.0 : 154.0,
              margin: isHorizontal
                  ? new EdgeInsets.only(left: 46.0)
                  : new EdgeInsets.only(top: 72.0),
              child: Container(
                margin: EdgeInsets.fromLTRB(isHorizontal ? 76.0 : 16.0,
                    isHorizontal ? 16.0 : 42.0, 16.0, 16.0),
                constraints: BoxConstraints.expand(),
                child: Column(
                  crossAxisAlignment: isHorizontal
                      ? CrossAxisAlignment.start
                      : CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      this.planet.name,
                      style: headerTextStyle,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      this.planet.location,
                      style: subHeaderTextStyle,
                    ),
                    Separator(),
                    Row(
                      mainAxisAlignment: isHorizontal
                          ? MainAxisAlignment.start
                          : MainAxisAlignment.center,
                      children: <Widget>[
                        Chip(
                          title: planet.distance,
                          image: 'images/ic_distance.png',
                          horizontal: isHorizontal,
                        ),
                        Chip(
                          title: planet.gravity,
                          image: 'images/ic_gravity.png',
                          horizontal: isHorizontal,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              decoration: BoxDecoration(
                color: Color(0xFF333366),
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10.0,
                    offset: Offset(0.0, 10.0),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 16.0),
              alignment: isHorizontal
                  ? FractionalOffset.centerLeft
                  : FractionalOffset.center,
              child: Hero(
                tag: 'planet ${planet.id}',
                child: Image(
                  image: AssetImage(this.planet.image),
                  height: 92.0,
                  width: 92.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Separator extends StatelessWidget {
  const Separator({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: new EdgeInsets.symmetric(vertical: 8.0),
        height: 2.0,
        width: 18.0,
        color: new Color(0xff00c6ff));
  }
}

class Chip extends StatelessWidget {
  final String title;
  final String image;
  final bool horizontal;
  Chip({this.image, this.title, this.horizontal});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: horizontal ? 1 : 0,
      child: Row(
        children: <Widget>[
          Image(
            image: AssetImage(image),
            height: 12.0,
          ),
          SizedBox(
            width: 8.0,
          ),
          Text(
            title,
            style: regularTextStyle,
          ),
        ],
      ),
    );
  }
}

final baseTextStyle = TextStyle(fontFamily: 'Poppins');

final headerTextStyle = baseTextStyle.copyWith(
  color: Colors.white,
  fontSize: 18.0,
  fontWeight: FontWeight.w600,
);

final regularTextStyle = baseTextStyle.copyWith(
    color: Color(0xffb6b2df), fontSize: 9.0, fontWeight: FontWeight.w400);

final subHeaderTextStyle = regularTextStyle.copyWith(fontSize: 12.0);
