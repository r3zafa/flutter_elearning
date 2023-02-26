import 'dart:math';

Map<String, String> msgMap = {
  'normal': 'you have a normal body weight. Good Job!',
  'overweight':
      'you have a higher than normal body weight. Try to exercise more.',
  'underweight':
      'You have a lower than normal body weight. You need to eat more.'
};

class CalculatorBrain {
  CalculatorBrain({
    required this.height,
    required this.weight,
  });

  final double height;
  final double weight;

  double getBmiAsDouble() {
    double result = weight / pow(height / 100, 2);
    return result;
  }

  String getBmiAsString({required int fixedTo}) {
    double result = weight / pow(height / 100, 2);
    return result.toStringAsFixed(fixedTo);
  }

  String getInterpretation() {
    double result = weight / pow(height / 100, 2);
    if (result > 25) {
      return msgMap['overweight']!;
    } else if (result > 18.5) {
      return msgMap['normal']!;
    } else {
      return msgMap['underweight']!;
    }
  }

  String getStatus() {
    double result = weight / pow(height / 100, 2);
    if (result > 25) {
      return 'Overweight';
    } else if (result > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }
}
