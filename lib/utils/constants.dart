import 'package:flutter/material.dart';

const String imageApiEndPoint =
    "https://api.mapmycrop.com/satellite/field-imagery?api_key=84246efe39a445a99f5178ffee413eee&farm_id=11099a48c9514b44bcd9aaa1978ea236&index=NDVI&satellite=S1&satellite_date=2024-06-24";

class XGap extends StatelessWidget {
  const XGap(this.x, {super.key});

  final double x;

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: x);
  }
}

class YGap extends StatelessWidget {
  const YGap(this.y, {super.key});

  final double y;

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: y);
  }
}

double getScreenX(BuildContext context) => MediaQuery.of(context).size.width;

double getScreenY(BuildContext context) => MediaQuery.of(context).size.height;
