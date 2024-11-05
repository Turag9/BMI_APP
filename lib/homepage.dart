import 'package:bmi_app/finalans.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  double _sliderValue = 0.00;
  double morf=0;
  var weightController = TextEditingController();
  var ageController = TextEditingController();
  String? _selectedGender; // Variable to track the selected gender

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0A0E21),
      appBar: AppBar(
        title: Center(
          child: Text(
            "BMI_CALCULATOR",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        backgroundColor: Color(0xFF1A1F38),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedGender = 'Female'; // Update the selected gender
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                        child: Column(
                          children: [
                            Icon(Icons.female, color: Colors.white, size: 100),
                            Text(
                              "Female",
                              style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        decoration: BoxDecoration(
                          color: _selectedGender == 'Female' ? Colors.pinkAccent : Color(0xFF1A1F38),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.8),
                              spreadRadius: 2,
                              blurRadius: 10,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedGender = 'Male'; // Update the selected gender
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                        child: Column(
                          children: [
                            Icon(Icons.male, color: Colors.white, size: 100),
                            Text(
                              "Male",
                              style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        decoration: BoxDecoration(
                          color: _selectedGender == 'Male' ? Colors.lightBlueAccent : Color(0xFF1A1F38),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.8),
                              spreadRadius: 2,
                              blurRadius: 10,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              height: 200,
              width: 300,
              decoration: BoxDecoration(
                  color: Color(0xFF1A1F38),
                  borderRadius: BorderRadius.circular(20)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Height(cm): ${_sliderValue.toStringAsFixed(1)}',
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                  Slider(
                    value: _sliderValue,
                    min: 0.00,
                    max: 300,
                    divisions: 10000,
                    activeColor: Colors.red,
                    inactiveColor: Colors.purple.withOpacity(0.5),
                    onChanged: (double value) {
                      setState(() {
                        _sliderValue = value;
                      });
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 150,
                      width: 250,
                      decoration: BoxDecoration(
                        color: Color(0xFF1A1F38),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.8),
                            spreadRadius: 2,
                            blurRadius: 10,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Weight:",
                            style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              controller: weightController,
                              decoration: InputDecoration(
                                hintText: "Enter Weight",
                                labelText: "Kg:",
                              ),
                              style: TextStyle(color: Colors.purple),
                              keyboardType: TextInputType.number, // Numeric input only
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 150,
                      width: 250,
                      decoration: BoxDecoration(
                        color: Color(0xFF1A1F38),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.8),
                            spreadRadius: 2,
                            blurRadius: 10,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Age:",
                            style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              controller: ageController,
                              decoration: InputDecoration(
                                hintText: "Enter Age",
                                labelText: "Years:",
                              ),
                              style: TextStyle(color: Colors.purple),
                              keyboardType: TextInputType.number, // Numeric input only
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF440D2E),
              ),
              onPressed: () {
                // Validate inputs
                if (_selectedGender == null) {
                  Fluttertoast.showToast(msg: 'Please Select Gender!');
                } else if (_sliderValue == 0.0) {
                  Fluttertoast.showToast(msg: 'Please Select Height!');
                } else if (weightController.text.isEmpty) {
                  Fluttertoast.showToast(msg: 'Please Enter Weight!');
                } else if (ageController.text.isEmpty) {
                  Fluttertoast.showToast(msg: 'Please Enter Age!');
                }
                else if(!isStringDouble(weightController.text))
                  {
                    Fluttertoast.showToast(msg: 'Please Enter correct weight!');
                  }
                else if(!isStringDouble(ageController.text))
                {
                  Fluttertoast.showToast(msg: 'Please Enter correct age!');
                }
                else
                  {
                    if(_selectedGender=="Male")morf=1;
                    else morf=2;
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Finalans(morf: morf,height: _sliderValue/100, age: int.parse(ageController.text), weight: double.parse(weightController.text))));
                  }
              },
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  "CALCULATE",
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
bool isStringDouble(String value) {
  return double.tryParse(value) != null;
}