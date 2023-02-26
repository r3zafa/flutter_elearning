import 'package:app10_clima/widget/status_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

TextStyle tsBottomCard = const TextStyle(
  color: Colors.black54,
  fontSize: 16,
  fontWeight: FontWeight.w500,
);

class BottomTempCard extends StatelessWidget {
  const BottomTempCard({
    Key? key,
    this.cardTimeStamp = 0,
    required this.cardForecast,
    required this.cardTitle,
    this.cardVisibility = 0,
  }) : super(key: key);

  final int cardTimeStamp;
  final int cardVisibility;
  final String cardForecast;
  final String cardTitle;

  getDate() {
    if (cardTimeStamp > 0) {
      DateTime dateFromApi =
          DateTime.fromMillisecondsSinceEpoch(cardTimeStamp * 1000);
      final date = DateFormat.Hm().format(dateFromApi);
      return date;
    } else {
      return '';
    }
  }

  getVisibility() {
    if (cardVisibility > 0) {
      return '$cardVisibility m';
    } else {
      return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    final String time = getDate();
    final String visibility = getVisibility();
    String subtitle;
    if (time.isNotEmpty) {
      subtitle = time;
    } else if (visibility.isNotEmpty) {
      subtitle = visibility;
    } else {
      subtitle = 'NA';
    }

    return Expanded(
      child: Container(
        height: 150,
        margin: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white12,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              cardTitle.toUpperCase(),
              style: tsBottomCard,
            ),
            StatusImage(
              forecast: cardForecast,
              size: 40,
              height: 40,
              weight: 40,
              margin: const EdgeInsets.all(12),
            ),
            Text(
              subtitle,
              style: tsBottomCard,
            ),
          ],
        ),
      ),
    );
  }
}
