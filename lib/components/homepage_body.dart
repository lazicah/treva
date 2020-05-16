import 'package:flutter/material.dart';
import 'package:treva/components/planet_row.dart';
import 'package:treva/models/planet_model.dart';

class HomePageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: new Color(0xFF736AB7),
        child: CustomScrollView(
          scrollDirection: Axis.vertical,
          slivers: <Widget>[
            SliverPadding(
              padding: EdgeInsets.symmetric(vertical: 24.0),
              sliver: SliverFixedExtentList(
                  delegate: SliverChildBuilderDelegate(
                      (context, index) => PlanetSummary(
                            planet: Planet.planets[index],
                            isHorizontal: true,
                          ),
                      childCount: Planet.planets.length),
                  itemExtent: 152.0),
            )
          ],
        ),
      ),
    );
  }
}
