import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String output = "0";
  String _output = "0";
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = "";

  buttonPressed(String buttonText) {
    if (buttonText == "AC") {
      _output = "0";
      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    } else if (buttonText == "+" ||
        buttonText == "-" ||
        buttonText == "×" ||
        buttonText == "÷") {
      num1 = double.parse(output);
      operand = buttonText;
      _output = "0";
    } else if (buttonText == ".") {
      if (_output.contains(".")) {
        return;
      } else {
        _output = _output + buttonText;
      }
    } else if (buttonText == "=") {
      num2 = double.parse(output);

      if (operand == "+") {
        _output = (num1 + num2).toString();
      }
      if (operand == "-") {
        _output = (num1 - num2).toString();
      }
      if (operand == "×") {
        _output = (num1 * num2).toString();
      }
      if (operand == "÷") {
        _output = (num1 / num2).toString();
      }

      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    } else {
      _output = _output + buttonText;
    }

    setState(() {
      output = double.parse(_output).toStringAsFixed(0);
    });
  }

  Widget buildButton(String buttonText,
      {Color backgroundColor = Colors.black}) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(1.0),
        child: OutlinedButton(
          style: OutlinedButton.styleFrom(
            backgroundColor: backgroundColor,
            padding: EdgeInsets.all(24.0),
            shape: CircleBorder(),
          ),
          child: Text(
            buttonText,
            style: GoogleFonts.roboto(
              color: Colors.white,
              fontSize: 36.0,
              fontWeight: FontWeight.w400,
            ),
          ),
          onPressed: () => buttonPressed(buttonText),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height * 0.1,
                horizontal: 12.0,
              ),
              child: Text(
                output,
                style: GoogleFonts.roboto(
                  fontSize: MediaQuery.of(context).size.width * 0.1,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buildButton("AC", backgroundColor: Color(0xFFff9f0a)),
                      buildButton("=", backgroundColor: Color(0xFFff9f0a)),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buildButton("7", backgroundColor: Color(0xFF333333)),
                      buildButton("8", backgroundColor: Color(0xFF333333)),
                      buildButton("9", backgroundColor: Color(0xFF333333)),
                      buildButton("÷", backgroundColor: Color(0xFFff9f0a)),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buildButton("4", backgroundColor: Color(0xFF333333)),
                      buildButton("5", backgroundColor: Color(0xFF333333)),
                      buildButton("6", backgroundColor: Color(0xFF333333)),
                      buildButton("×", backgroundColor: Color(0xFFff9f0a)),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buildButton("1", backgroundColor: Color(0xFF333333)),
                      buildButton("2", backgroundColor: Color(0xFF333333)),
                      buildButton("3", backgroundColor: Color(0xFF333333)),
                      buildButton("-", backgroundColor: Color(0xFFff9f0a)),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buildButton(".", backgroundColor: Color(0xFF333333)),
                      buildButton("0", backgroundColor: Color(0xFF333333)),
                      buildButton("00", backgroundColor: Color(0xFF333333)),
                      buildButton("+", backgroundColor: Color(0xFFff9f0a)),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() => runApp(MaterialApp(
      home: CalculatorScreen(),
      debugShowCheckedModeBanner: false,
    ));
