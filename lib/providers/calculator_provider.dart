import 'package:calculator_app_flutter/Models/calculator_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:math_expressions/math_expressions.dart';

final calculatorProvider =
    StateNotifierProvider<CalculatorProvider, CalculatorModel>(
        (ref) => CalculatorProvider());

class CalculatorProvider extends StateNotifier<CalculatorModel> {
  CalculatorProvider()
      : super(CalculatorModel(
            result: '0',
            equation: '0',
            expression: '',
            equationFontSize: 35,
            resultFontSize: 45));

  void buttonPressed(String buttonText) {
    if (buttonText == 'C') {
      state.equation = '0';
      state.result = '0';
      state.equationFontSize = 35;
      state.resultFontSize = 45;
    } else if (buttonText == '⌫') {
      state.equationFontSize = 45;
      state.resultFontSize = 35;
      state.equation = state.equation.substring(0, state.equation.length - 1);
      if (state.equation == '') {
        state.equation = '0';
      }
    } else if (buttonText == '=') {
      state.equationFontSize = 35;
      state.resultFontSize = 45;
      state.expression = state.equation;
      state.expression = state.expression.replaceAll('x', '*');
      state.expression = state.expression.replaceAll('÷', '/');
      try {
        Parser p = Parser();
        Expression exp = p.parse(state.expression);
        ContextModel cm = ContextModel();
        state.result = '${exp.evaluate(EvaluationType.REAL, cm)}';
      } catch (e) {
        state.result = 'Error';
      }
    } else {
      state.equationFontSize = 45;
      state.resultFontSize = 35;
      if (state.equation == '0') {
        state.equation = buttonText;
      } else {
        state.equation += buttonText;
      }
    }
    state = CalculatorModel(
        result: state.result,
        equation: state.equation,
        expression: state.expression,
        equationFontSize: state.equationFontSize,
        resultFontSize: state.resultFontSize);
  }
}
