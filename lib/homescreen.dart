// ignore_for_file: must_be_immutable, camel_case_types, duplicate_ignore

import 'package:calculatorapp/button.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

// ignore: camel_case_types
class homescreen extends StatefulWidget {
  const homescreen({super.key});

  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  var userinput = ('');

  var answer = ('');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Expanded(
                child: Column(mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 50,
                      width: 300,
                      decoration:  BoxDecoration(borderRadius: BorderRadius.circular(20),
                          color: const Color.fromARGB(255, 49, 49, 49)),
                      child: Center(
                        child: Text(userinput.toString(),
                            style: const TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 255, 255, 255))),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      height: 50,
                      width: 300,
                      decoration:  BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                          color: const Color.fromARGB(255, 43, 42, 42)),
                      child: Center(
                        child: Text(answer.toString(),
                            style: const TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 248, 247, 247))),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 60),
              child: Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Row(
                      children: [
                        MyButton(
                          title: 'AC',
                          color: Colors.grey,
                          onpress: () {
                            userinput = '';
                            answer = '';
                            setState(() {});
                          },
                        ),
                        MyButton(
                            title: '+/-',
                            color: Colors.grey,
                            onpress: () {
                              userinput += '+/-';
                              setState(() {});
                            }),
                        MyButton(
                            title: '%',
                            color: Colors.grey,
                            onpress: () {
                              userinput += '%';
                              setState(() {});
                            }),
                        MyButton(
                            title: '/',
                            color: Colors.amber,
                            onpress: () {
                              userinput += '/';
                              setState(() {});
                            }),
                      ],
                    ),
                    Row(
                      children: [
                        MyButton(
                            title: '7',
                            color: Colors.grey,
                            onpress: () {
                              userinput += '7';
                              setState(() {});
                            }),
                        MyButton(
                            title: '8',
                            color: Colors.grey,
                            onpress: () {
                              userinput += '8';
                              setState(() {});
                            }),
                        MyButton(
                            title: '9',
                            color: Colors.grey,
                            onpress: () {
                              userinput += '9';
                              setState(() {});
                            }),
                        MyButton(
                            title: 'x',
                            color: Colors.amber,
                            onpress: () {
                              userinput += 'x';
                              setState(() {});
                            }),
                      ],
                    ),
                    Row(
                      children: [
                        MyButton(
                            title: '4',
                            color: Colors.grey,
                            onpress: () {
                              userinput += '4';
                              setState(() {});
                            }),
                        MyButton(
                            title: '5',
                            color: Colors.grey,
                            onpress: () {
                              userinput += '5';
                              setState(() {});
                            }),
                        MyButton(
                            title: '6',
                            color: Colors.grey,
                            onpress: () {
                              userinput += '6';
                              setState(() {});
                            }),
                        MyButton(
                            title: '-',
                            color: Colors.amber,
                            onpress: () {
                              userinput += '-';
                              setState(() {});
                            }),
                      ],
                    ),
                    Row(
                      children: [
                        MyButton(
                            title: '1',
                            color: Colors.grey,
                            onpress: () {
                              userinput += '1';
                              setState(() {});
                            }),
                        MyButton(
                            title: '2',
                            color: Colors.grey,
                            onpress: () {
                              userinput += '2';
                              setState(() {});
                            }),
                        MyButton(
                            title: '3',
                            color: Colors.grey,
                            onpress: () {
                              userinput += '3';
                              setState(() {});
                            }),
                        MyButton(
                            title: '+',
                            color: Colors.amber,
                            onpress: () {
                              userinput += '+';
                              setState(() {});
                            }),
                      ],
                    ),
                    Row(
                      children: [
                        MyButton(
                            title: '0',
                            color: Colors.grey,
                            onpress: () {
                              userinput += '0';
                              setState(() {});
                            }),
                        MyButton(
                            title: '.',
                            color: Colors.grey,
                            onpress: () {
                              userinput += '.';
                              setState(() {});
                            }),
                        MyButton(
                            title: 'DEL',
                            color: Colors.grey,
                            onpress: () {
                              userinput =
                                  userinput.substring(0, userinput.length - 1);
                              setState(() {});
                            }),
                        MyButton(
                            title: '=',
                            color: Colors.amber,
                            onpress: () {
                              equalPress();
                              setState(() {});
                            }),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void equalPress() {
    String finaluserInput = userinput;
    finaluserInput = userinput.replaceAll('x', '*');
    Parser p = Parser();
    Expression expression = p.parse(finaluserInput);
    ContextModel contextModel = ContextModel();
    double eval = expression.evaluate(
      EvaluationType.REAL,
      contextModel,
    );
    answer = eval.toString();
  }
}
