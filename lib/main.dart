// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_final_fields

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final controler = TextEditingController();
  List<bool> _selection = [true, false, false];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Total Amount"),
              SizedBox(
                width: 80,
                child: TextField(
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  controller: controler,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(hintText: "\$100.00"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: ToggleButtons(
                  children: [
                    Text("10%"),
                    Text("15%"),
                    Text("20%"),
                  ],
                  isSelected: _selection,
                  onPressed: updateSelection,
                ),
              ),
              TextButton(
                onPressed: calculateTip,
                child: Text("Calculate Tip"),
                style: TextButton.styleFrom(
                  backgroundColor: Colors.green,
                  primary: Colors.white,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void updateSelection(int selectedIndex) {
    setState(() {
      for (int i = 0; i < _selection.length; i++) {
        _selection[i] = selectedIndex == i;
      }
    });
  }

  void calculateTip() {
    final totalAmount = double.parse(controler.text);
    final seltectedIndex = _selection.indexWhere((element) => element);
    final tipPercentage = [0.1, 0.15, 0.2][seltectedIndex];

    final tipTotal = (totalAmount * tipPercentage).toStringAsFixed(2);
  }
}
