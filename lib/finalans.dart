import 'package:flutter/material.dart';

class Finalans extends StatefulWidget {
  final double height;
  final int age;
  final double weight;
  final double morf; // This seems like a result or factor.

  const Finalans({
    super.key,
    required this.morf,
    required this.height,
    required this.age,
    required this.weight,
  });

  @override
  State<Finalans> createState() => _FinalansState();
}

class _FinalansState extends State<Finalans> {
  double? _bmiResult;

  @override
  void initState() {
    super.initState();
    _calculateBMI();
  }

  // BMI Calculation
  void _calculateBMI() {
    setState(() {
      _bmiResult = widget.weight / (widget.height * widget.height); // BMI formula
    });
  }
  String getgender(){
    if(widget.morf==1.0)return "Male";
    else return "female";
  }
  String _getCategory() {
    if (_bmiResult == null) {
      return "Calculating...";
    }
    if (_bmiResult! < 18.5) {
      return "Underweight";
    } else if (_bmiResult! >= 18.5 && _bmiResult! < 24.9) {
      return "Normal weight";
    } else if (_bmiResult! >= 25 && _bmiResult! < 29.9) {
      return "Overweight";
    } else {
      return "Obesity";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0A0E21), // Dark background color
      appBar: AppBar(
        title: Text("Your Results"),
        backgroundColor: Color(0xFF1D1E33),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Card(
          color: Color(0xFF1A1F38),
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),  // Optional: set rounded corners
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),  // Add some padding inside the card
            child: Center(  // This ensures the entire column is centered
              child: Column(
                mainAxisSize: MainAxisSize.min,  // Minimize the vertical space of the column
                crossAxisAlignment: CrossAxisAlignment.center,  // Center all items horizontally
                children: [
                  // Display the height, weight, age, and morf values
                  Text(
                    "Height: ${widget.height.toStringAsFixed(4)} m",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                    textAlign: TextAlign.center,  // Center text horizontally
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Weight: ${widget.weight} kg",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                    textAlign: TextAlign.center,  // Center text horizontally
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Age: ${widget.age} years",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                    textAlign: TextAlign.center,  // Center text horizontally
                  ),
                  SizedBox(height: 10,),
                  Text("Gender: ${getgender()}"),

                  SizedBox(height: 30),

                  // Display BMI result
                  Text(
                    "BMI: ${_bmiResult?.toStringAsFixed(2) ?? 'Calculating...'}",
                    style: TextStyle(color: Colors.white, fontSize: 24),
                    textAlign: TextAlign.center,  // Center text horizontally
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Category: ${_getCategory()}",
                    style: TextStyle(color: Color(0xFF09FF7A), fontSize: 22),
                    textAlign: TextAlign.center,  // Center text horizontally
                  ),
                  SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
