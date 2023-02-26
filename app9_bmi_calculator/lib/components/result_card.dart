import 'package:flutter/material.dart';

import '../theme/custom_colors.dart';
import '../values/text_styles.dart';

const EdgeInsets marginAll = EdgeInsets.fromLTRB(24, 48, 24, 24);

class ResultCard extends StatelessWidget {
  const ResultCard({
    Key? key,
    required this.interpretation,
    required this.status,
    required this.result,
  }) : super(key: key);

  final String interpretation;
  final String status;
  final String result;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: marginAll,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Text(
              'Your result',
              style: tsResultTitle,
            ),
          ),
          Expanded(
            flex: 8,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: inactiveCardColor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    status,
                    style: tsResultStatus,
                  ),
                  Text(
                    result,
                    style: tsResultBoldValue,
                  ),
                  Text(
                    'Normal BMI range',
                    style: labelTextStyle(isActive: false),
                  ),
                  Text(
                    '12 - 25 kg/m2',
                    style: labelTextStyle(isActive: true),
                  ),
                  Row(
                    children: [
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 15,
                            right: 15,
                          ),
                          child: Text(
                            interpretation,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'Save Result',
                      style: labelTextStyle(isActive: true),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
