import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

import '../utils/map_values.dart';

class StatusImage extends StatelessWidget {
  const StatusImage({
    Key? key,
    required this.forecast,
    required this.size,
    required this.height,
    this.weight = double.infinity,
    this.margin =
        const EdgeInsets.only(top: 30, bottom: 10, left: 10, right: 10),
  }) : super(key: key);

  final String forecast;
  final double size;
  final double height;
  final double weight;
  final EdgeInsets margin;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: weight,
      height: height,
      margin: margin,
      child: Image(
        image: Svg(
          kSvgPath[forecast]!,
          size: Size(size, size),
        ),
      ),
    );
  }
}
