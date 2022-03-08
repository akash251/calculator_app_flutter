class CalculatorModel {
  late String equation;
  late String result;
  late String expression;
  late double equationFontSize;
  late double resultFontSize;

  CalculatorModel(
      {required this.result,
      required this.equation,
      required this.expression,
      required this.equationFontSize,
      required this.resultFontSize});
}
