import 'package:flutter/material.dart';
import 'dart:math';

class KalkulatorPage extends StatefulWidget {
  const KalkulatorPage({super.key});

  @override
  State<KalkulatorPage> createState() => _KalkulatorPageState();
}

class _KalkulatorPageState extends State<KalkulatorPage> {
  String _output = "0";
  double num1 = 0.0;
  String operand = "";
  String _display = "0";

  void buttonPressed(String buttonText) {
    if (buttonText == "C") { // Tombol Hapus
      _display = "0";
      num1 = 0.0;
      operand = "";
    } else if (buttonText == "+" || buttonText == "-" || buttonText == "x" || buttonText == "/") {
      // Tambah, Kurang, Kali, Bagi
      num1 = double.tryParse(_display) ?? 0.0;
      operand = buttonText;
      _display = "0";
    } else if (buttonText == "=") {
      if (operand.isNotEmpty) {
        double num2 = double.tryParse(_display) ?? 0.0;
        if (operand == "+") _display = (num1 + num2).toString();
        if (operand == "-") _display = (num1 - num2).toString();
        if (operand == "x") _display = (num1 * num2).toString();
        if (operand == "/") _display = (num1 / num2).toString();

        num1 = 0.0;
        operand = "";
      }
    } else if (buttonText == "x²") {
      // Kuadrat
      double currentValue = double.tryParse(_display) ?? 0.0;
      _display = (pow(currentValue, 2)).toString();
    } else if (buttonText == "√") {
      // Akar Kuadrat
      double currentValue = double.tryParse(_display) ?? 0.0;
      _display = (sqrt(currentValue)).toString();
    } else {
      // Angka Ditekan
      if (_display == "0") {
        _display = buttonText;
      } else {
        _display += buttonText;
      }
    }

    // Cleaning up the display
    if (_display.endsWith(".0")) {
      _display = _display.substring(0, _display.length - 2);
    }

    setState(() {
      _output = _display;
    });
  }

  Widget buildButton(String buttonText, Color color) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(4.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            padding: const EdgeInsets.all(20.0),
          ),
          child: Text(
            buttonText,
            style: const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          onPressed: () => buttonPressed(buttonText),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          // Tampilan Hasil
          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 12.0),
            child: Text(
              _output,
              style: const TextStyle(fontSize: 48.0, fontWeight: FontWeight.bold),
            ),
          ),
          const Expanded(child: Divider()),

          // Tata Letak Tombol
          Column(
            children: [
              Row(children: [buildButton("C", Colors.red), buildButton("x²", Colors.blueGrey), buildButton("√", Colors.blueGrey), buildButton("/", Colors.orange)]),
              Row(children: [buildButton("7", Colors.black54), buildButton("8", Colors.black54), buildButton("9", Colors.black54), buildButton("x", Colors.orange)]),
              Row(children: [buildButton("4", Colors.black54), buildButton("5", Colors.black54), buildButton("6", Colors.black54), buildButton("-", Colors.orange)]),
              Row(children: [buildButton("1", Colors.black54), buildButton("2", Colors.black54), buildButton("3", Colors.black54), buildButton("+", Colors.orange)]),
              Row(children: [buildButton(".", Colors.black54), buildButton("0", Colors.black54), buildButton("00", Colors.black54), buildButton("=", Colors.green)]),
            ],
          )
        ],
      ),
    );
  }
}