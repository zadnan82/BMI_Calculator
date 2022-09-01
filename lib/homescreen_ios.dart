import 'package:bmi_calculator/bmi.dart';
import 'package:bmi_calculator/bmi_list.dart';
import 'package:bmi_calculator/homescreen_android.dart';
import 'package:bmi_calculator/homescreen_ios.dart';
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:gender_picker/source/enums.dart';
import 'package:gender_picker/source/gender_picker.dart';
import 'modell.dart';
import 'dart:math';
import 'dart:io';

class HomeIOS extends StatefulWidget {
  @override
  State<HomeIOS> createState() => _HomeIOS();
}

class _HomeIOS extends State<HomeIOS> {
  List bmiListan = [];

  double? bmi;

  final lengthController = TextEditingController();
  final weightController = TextEditingController();

  final data = Modellen(length: 0.0, weight: 0.0, bmi: 0.0, genders: false);

  String message = "Please enter your length and weight!";

  String message2 = "";
  String message3 = "";

  Gender? gender;

  int listCounter = 0;

  void startCalculator(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) =>
            BMI(bmi: bmi!, message2: message2, message3: message3),
      ),
    );
  }

  // void showList(BuildContext context) {
  //   showModalBottomSheet(
  //       context: context,
  //       builder: (_) => GestureDetector(
  //             child: BMIList(bmiListan),
  //           ));
  // }

  void reset() {
    setState(() {
      bmiListan = [];
    });
  }

  void addToList(double bmi) {
    setState(() {
      bmiListan.add(bmi);
    });
  }

  void increaseListCounter() {
    setState(() {
      listCounter = 1;
    });
  }

  void resetListCounter() {
    setState(() {
      listCounter = 0;
    });
  }

  void calculate() {
    double? length = double.tryParse(lengthController.value.text);
    double? weight = double.tryParse(weightController.value.text);

    setState(() {
      if (length == null || length <= 0 || weight == null || weight <= 0) {
        setState(() {
          message = "Your length and weigh must be entered";
        });
        return;
      }
      bmi = weight / pow(length / 100, 2);
      if (bmi! < 18.5) {
        message2 = "You are underweight";
        message3 = "Underweight";
      } else if (bmi! < 25) {
        message2 = "You body is fine";
        message3 = "Normal";
      } else if (bmi! < 30) {
        message2 = 'You are overweight';
        message3 = "Overweight";
      } else {
        message2 = 'You are obese';
        message3 = "Obese";
      }
      addToList(bmi!);
      startCalculator(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        backgroundColor: Colors.amberAccent,
        navigationBar: CupertinoNavigationBar(
          middle: const Text(
            "BMI Calculator",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 25, color: Colors.black),
          ),
          trailing: CupertinoButton(
            padding: const EdgeInsets.all(10),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) => BMIList(bmiListan, reset)),
              );
            },
            child: const Text("List"),
          ),
          backgroundColor: const Color.fromARGB(255, 132, 250, 81),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                // height: (MediaQuery.of(context).size.height -
                //         MediaQuery.of(context).padding.top) *
                //     0.6,
                child: Center(
                    child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Card(
                          color: Colors.white,
                          elevation: 15,
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                CupertinoTextField(
                                  controller: lengthController,
                                  prefix: const Text("Height (m)"),
                                  keyboardType:
                                      const TextInputType.numberWithOptions(
                                          decimal: true),
                                ),
                                const Padding(
                                  padding: EdgeInsets.all(10.0),
                                ),
                                CupertinoTextField(
                                  controller: weightController,
                                  prefix: const Text("Weight (kg)"),
                                  keyboardType:
                                      const TextInputType.numberWithOptions(
                                          decimal: true),
                                ),

                                Padding(
                                  padding: const EdgeInsets.all(30),
                                  child: Container(
                                      child: GenderPickerWithImage(
                                    showOtherGender: true,
                                    verticalAlignedText: false,
                                    selectedGender: Gender.Female,
                                    selectedGenderTextStyle: TextStyle(
                                        color: Color(0xFF8b32a8),
                                        fontWeight: FontWeight.bold),
                                    unSelectedGenderTextStyle: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.normal),

                                    equallyAligned: true,
                                    animationDuration:
                                        Duration(milliseconds: 300),
                                    isCircular: true,
                                    // default : true,
                                    opacityOfGradient: 0.4,
                                    padding: const EdgeInsets.all(3),
                                    size: 50,
                                    onChanged: (Gender? value) {
                                      gender = value;
                                    }, //default : 40
                                  )),
                                ),

                                Text(
                                  message,
                                  textAlign: TextAlign.center,
                                ),
                                // Padding(
                                //   padding: const EdgeInsets.all(30.0),
                                //   child: ElevatedButton(
                                //     onPressed: reset,
                                //     child: const Text("Delete list of saved BMI's"),
                                //   ),
                                // ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        // height: (MediaQuery.of(context).size.height -
                        //         MediaQuery.of(context).padding.top) *
                        //     0.1,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: ElevatedButton(
                            onPressed: calculate,
                            child: const Text("Calculate"),
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
              )
            ],
          ),
        )
        //listCounter == 0?

        );
    // :
    // CupertinoPageScaffold(
    //     navigationBar: CupertinoNavigationBar(
    //       middle: const Text(
    //         "BMI List",
    //         style: TextStyle(
    //             fontWeight: FontWeight.bold,
    //             fontSize: 25,
    //             color: Colors.black),
    //       ),
    //       backgroundColor: const Color.fromARGB(255, 132, 250, 81),
    //     ),
    //     child: Flex(
    //       direction: Axis.vertical,
    //       children: <Widget>[
    //         Flexible(
    //           flex: 1,
    //           child: ListView.builder(
    //             itemCount: bmiListan.length,
    //             itemBuilder: (context, index) {
    //               return Padding(
    //                 padding: EdgeInsets.only(bottom: 60),
    //                 child: Card(
    //                     elevation: 5,
    //                     child: Column(
    //                       children: [
    //                         Text(
    //                           "${double.parse(bmiListan[index].toStringAsFixed(1))}",
    //                           // this.result == null ? 'No Result' : result.toStringAsFixed(2),
    //                           style: const TextStyle(fontSize: 50),
    //                           textAlign: TextAlign.center,
    //                         ),
    //                       ],
    //                     )),
    //               );
    //             },
    //           ),
    //         ),
    //         ElevatedButton(
    //           onPressed: resetListCounter,
    //           child: Icon(Icons.arrow_back),
    //         ),
    //       ],
    //     ),
    //   ),
    //);

    // floatingActionButton: FloatingActionButton(onPressed: resetListCounter, child:  Icon(Icons.arrow_back),) ,

    // floatingActionButton: FloatingActionButton(onPressed: () => increaseListCounter(), child: Icon(Icons.list),),

    // BMIList(bmiListan);
  }
}
