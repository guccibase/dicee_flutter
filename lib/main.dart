import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('Dicee'),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  Random random = new Random();

  int rightDiceNumber = 1;
  int leftDiceNumber = 2;
  String screenText = 'click';

  diceChange() {
    rightDiceNumber = random.nextInt(6) + 1;
    leftDiceNumber = random.nextInt(6) + 1;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: FlatButton(
                    onPressed: () {
                      setState(() {
                        diceChange();
                        leftDiceNumber == rightDiceNumber
                            ? screenText =
                                'Congrats! it\'s a match $leftDiceNumber:$rightDiceNumber'
                            : screenText = ' Click ';
                      });
                    },
                    child: Image.asset('images/dice$rightDiceNumber.png'),
                  ),
                ),
                Expanded(
                  child: FlatButton(
                    onPressed: () {
                      setState(() {
                        diceChange();
                        leftDiceNumber == rightDiceNumber
                            ? screenText =
                                'Congrats! it\'s a match $leftDiceNumber:$rightDiceNumber'
                            : screenText = ' Click ';
                      });
                    },
                    child: Image.asset('images/dice$leftDiceNumber.png'),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 120,
          ),
          Container(
            height: 60,
            width: 300,
            child: Center(
              child: Text(
                screenText,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
    );
  }
}
