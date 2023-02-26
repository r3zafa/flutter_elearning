import 'package:flutter/cupertino.dart';
import 'package:hexcolor/hexcolor.dart';

const double cardMarginValue = 3.0;
EdgeInsets cardMargin = const EdgeInsets.all(cardMarginValue);
const double cardBorderRadiusValue = 10.0;
BorderRadius cardBorderRadius = BorderRadius.circular(cardBorderRadiusValue);

class ReusableCard extends StatelessWidget {
  const ReusableCard({
    super.key,
    required this.cardColor,
    required this.cardChild,
    required this.onPress,
  });

  final HexColor cardColor;
  final Widget cardChild;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: cardMargin,
        decoration: BoxDecoration(
          borderRadius: cardBorderRadius,
          color: cardColor,
        ),
        child: cardChild,
      ),
    );
  }
}
