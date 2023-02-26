import 'package:app9_bmi_calculator/utils/input_arguments.dart';
import 'package:flutter/material.dart';

import '../components/action_btn.dart';
import '../components/result_card.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({
    super.key,
  });
  static const routeName = '/calc';

  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context)!.settings.arguments as InputArguments;

    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              flex: 8,
              child: ResultCard(
                interpretation: arguments.interpretation,
                result: arguments.result,
                status: arguments.status,
              ),
            ),
            Expanded(
              child: ActionBtn(
                actionTitle: 'Re-calculate your BMI',
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
