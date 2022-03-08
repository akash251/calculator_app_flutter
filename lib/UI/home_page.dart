import 'package:calculator_app_flutter/providers/calculator_provider.dart';
import 'package:calculator_app_flutter/widgets/build_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text('Simple Calculator',style: TextStyle(fontSize: 25),),
        centerTitle: true,
      ),
      body: Consumer(builder: (context, ref, child) {
        final answer = ref.watch(calculatorProvider);
        return Column(
          children: [
            Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
              child: Text(
                answer.equation,
                style: TextStyle(fontSize: answer.equationFontSize),
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
              child: Text(
                answer.result,
                style: TextStyle(fontSize: answer.resultFontSize),
              ),
            ),
            Expanded(
              child: Divider(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.75,
                  child: Table(
                    children: [
                      TableRow(children: [
                        buildButton('C', 1, Colors.purple),
                        buildButton('⌫', 1, Colors.indigo),
                        buildButton('÷', 1, Colors.indigo),
                      ]),
                      TableRow(children: [
                        buildButton('7', 1, Colors.brown),
                        buildButton('8', 1, Colors.brown),
                        buildButton('9', 1, Colors.brown),
                      ]),
                      TableRow(children: [
                        buildButton('4', 1, Colors.brown),
                        buildButton('5', 1, Colors.brown),
                        buildButton('6', 1, Colors.brown),
                      ]),
                      TableRow(children: [
                        buildButton('1', 1, Colors.brown),
                        buildButton('2', 1, Colors.brown),
                        buildButton('3', 1, Colors.brown),
                      ]),
                      TableRow(children: [
                        buildButton('.', 1, Colors.brown),
                        buildButton('0', 1, Colors.brown),
                        buildButton('00', 1, Colors.brown),
                      ]),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.25,
                  child: Table(
                    children: [
                      TableRow(children: [
                        buildButton('x', 1, Colors.indigo),
                      ]),
                      TableRow(children: [
                        buildButton('-', 1, Colors.indigo),
                      ]),
                      TableRow(children: [
                        buildButton('+', 1, Colors.indigo),
                      ]),
                      TableRow(children: [
                        buildButton('=', 2, Colors.purple),
                      ])
                    ],
                  ),
                )
              ],
            ),
          ],
        );
      }),
    );
  }
}
