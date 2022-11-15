import 'dart:math';
import 'constants.dart';

class CalculatorBrain {
  final int height;
  final int weight;
  double _bmi;
  Results _results = Results.NORMAL;

  CalculatorBrain({this.height, this.weight});

  String calculateBMI(){
    _bmi = weight / pow(height/100,2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult()
  {
    if (_bmi>=25) {
        _results = Results.OVERWEIGHT;
        return 'Overweight';
      }
    else if (_bmi<=18.5){
      _results = Results.UNDERWEIGHT;
      return 'Underweight';
    }
    else {
      _results = Results.NORMAL;
      return 'Normal';
    }
  }

  String getInterpretation()
  {
    getResult();
    switch (_results) {
      case Results.OVERWEIGHT:
        {
          return 'You have a higher than normal body weight. Try to excercise more.';
        }
        break;
      case Results.UNDERWEIGHT:
        {
          return "You have a lower than normal body weight. Try to eat more.";
        }
        break;
      case Results.NORMAL:
        {
          return "You have a normal body weight. GG.";
        }
        break;
    }
  }
}