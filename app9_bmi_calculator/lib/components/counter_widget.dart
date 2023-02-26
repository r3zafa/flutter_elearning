import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../theme/custom_colors.dart';
import '../values/text_styles.dart';
import 'round_icon_btn.dart';

class CounterWidget extends StatelessWidget {
  const CounterWidget({
    Key? key,
    required this.countValue,
    required this.title,
    required this.discriminationFunction,
    required this.additionFunction,
  }) : super(key: key);

  final int countValue;
  final String title;
  final VoidCallback discriminationFunction;
  final VoidCallback additionFunction;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title.toUpperCase(),
          style: labelTextStyle(isActive: false),
        ),
        const SizedBox(height: 5),
        Text(
          countValue.toString(),
          style: tsSliderLabelTextStyle,
        ),
        const SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            RoundIconBtn(
              onPressed: discriminationFunction,
              fillColor: activeCardColor,
              iconData: FontAwesomeIcons.minus,
            ),
            RoundIconBtn(
              onPressed: additionFunction,
              fillColor: activeCardColor,
              iconData: FontAwesomeIcons.plus,
            ),
          ],
        ),
      ],
    );
  }
}
