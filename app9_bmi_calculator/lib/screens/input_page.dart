import 'package:app9_bmi_calculator/utils/calculator_brain.dart';
import 'package:app9_bmi_calculator/utils/input_arguments.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../components/action_btn.dart';
import '../components/counter_widget.dart';
import '../components/icon_with_text.dart';
import '../components/reusable_card.dart';
import '../theme/custom_colors.dart';
import '../values/enums.dart';
import '../values/text_styles.dart';

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);
  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender = Gender.none;
  double heightValue = 140;
  double weightValue = 35;
  int ageValue = 12;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
      ),
      body: Container(
        margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
        child: Column(
          children: [
            Expanded(
              flex: 8,
              child: Container(
                margin: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Row(
                        children: [
                          Expanded(
                            child: ReusableCard(
                              onPress: () {
                                setState(() {
                                  selectedGender = Gender.male;
                                });
                              },
                              cardColor: selectedGender == Gender.male
                                  ? activeCardColor
                                  : inactiveCardColor,
                              cardChild: IconWithText(
                                isActive: selectedGender == Gender.male
                                    ? true
                                    : false,
                                icon: FontAwesomeIcons.mars,
                                title: 'Male',
                              ),
                            ),
                          ),
                          Expanded(
                            child: ReusableCard(
                              onPress: () {
                                setState(() {
                                  selectedGender = Gender.female;
                                });
                              },
                              cardColor: selectedGender == Gender.female
                                  ? activeCardColor
                                  : inactiveCardColor,
                              cardChild: IconWithText(
                                isActive: selectedGender == Gender.female
                                    ? true
                                    : false,
                                icon: FontAwesomeIcons.venus,
                                title: 'Female',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 15.0),
                    Expanded(
                      flex: 5,
                      child: ReusableCard(
                        onPress: () {},
                        cardColor: inactiveCardColor,
                        cardChild: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Height'.toUpperCase(),
                              style: labelTextStyle(isActive: false),
                            ),
                            const SizedBox(height: 15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.alphabetic,
                              children: [
                                Text(
                                  heightValue.toString(),
                                  style: tsSliderLabelTextStyle,
                                ),
                                const SizedBox(width: 3),
                                Text(
                                  'cm',
                                  style: labelTextStyle(isActive: false),
                                )
                              ],
                            ),
                            const SizedBox(height: 15),
                            SliderTheme(
                              data: SliderTheme.of(context).copyWith(
                                trackHeight: 1,
                                thumbColor: secondaryColor,
                                overlayColor: overlaySliderSecondaryColor,
                                activeTrackColor: Colors.white,
                                inactiveTrackColor: mutedSliderColor,
                                thumbShape: const RoundSliderThumbShape(
                                  enabledThumbRadius: 15.0,
                                ),
                                overlayShape: const RoundSliderOverlayShape(
                                  overlayRadius: 25,
                                ),
                              ),
                              child: Slider(
                                value: heightValue,
                                min: 100.0,
                                max: 250.0,
                                divisions: 300,
                                onChanged: (double val) {
                                  var dAsString = val.toStringAsFixed(1);
                                  setState(() {
                                    heightValue = double.parse(dAsString);
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 15.0),
                    Expanded(
                      flex: 4,
                      child: Container(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Row(
                          children: [
                            Expanded(
                              child: ReusableCard(
                                cardColor: inactiveCardColor,
                                onPress: () {},
                                cardChild: CounterWidget(
                                  countValue: weightValue.toInt(),
                                  title: 'Weight',
                                  discriminationFunction: () {
                                    setState(() {
                                      if (weightValue > 0) {
                                        weightValue--;
                                      }
                                    });
                                  },
                                  additionFunction: () {
                                    setState(() {
                                      if (weightValue < 90) {
                                        weightValue++;
                                      }
                                    });
                                  },
                                ),
                              ),
                            ),
                            Expanded(
                                child: ReusableCard(
                              cardColor: inactiveCardColor,
                              cardChild: CounterWidget(
                                countValue: ageValue,
                                title: 'Age',
                                discriminationFunction: () {
                                  setState(() {
                                    if (ageValue > 1) {
                                      ageValue--;
                                    }
                                  });
                                },
                                additionFunction: () {
                                  setState(() {
                                    if (ageValue < 90) {
                                      ageValue++;
                                    }
                                  });
                                },
                              ),
                              onPress: () {},
                            )),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 15.0),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ActionBtn(
                actionTitle: 'Calculate your BMI',
                onPressed: () {
                  CalculatorBrain calc = CalculatorBrain(
                    height: heightValue,
                    weight: weightValue,
                  );
                  Navigator.pushNamed(
                    context,
                    '/calc',
                    arguments: InputArguments(
                      result: calc.getBmiAsString(fixedTo: 1),
                      status: calc.getStatus(),
                      interpretation: calc.getInterpretation(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
