import 'package:bmi_calculator/modell.dart';
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'dart:math';
import 'dart:io';

class BMI extends StatefulWidget {
  //
  BMI(
      {Key? key,
      required this.bmi,
      required this.message2,
      required this.message3})
      : super(key: key);

  final double bmi;
  final String message2;
  final String message3;

  // const BMI({required this.data, double? bmi});
  //, @required this.addToList , @required this.reset);

  // final Function addToList;
  //final Function reset;

  @override
  State<BMI> createState() => _BMIState();
}

class _BMIState extends State<BMI> {
  void skickaTillbaka() {
    // widget.addToList;
    // widget.reset;
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return Platform.isAndroid
        ? Scaffold(
            appBar: AppBar(
              backgroundColor: Color.fromARGB(255, 132, 250, 81),
              title: const Text(
                "Results",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Colors.black),
              ),
            ),
            backgroundColor: Colors.amberAccent,
            body: isLandscape
                ? SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Center(
                        child: Column(
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Text(
                                "Your Result Is: ",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 25),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 30.0),
                              child: SizedBox(
                                width: 350,
                                child: Card(
                                  color: Colors.white,
                                  elevation: 15,
                                  child: Padding(
                                    padding: const EdgeInsets.all(20),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          "${widget.message3} ",
                                          style: const TextStyle(fontSize: 30),
                                          textAlign: TextAlign.center,
                                        ),
                                        Text(
                                          "${double.parse(widget.bmi.toStringAsFixed(1))}",
                                          // this.result == null ? 'No Result' : result.toStringAsFixed(2),
                                          style: const TextStyle(fontSize: 50),
                                          textAlign: TextAlign.center,
                                        ),
                                        const SizedBox(
                                          height: 30,
                                        ),
                                        Text("${widget.message2}"),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Material(
                                            child: CircleAvatar(
                                              radius: 30,
                                              backgroundColor: Color.fromARGB(
                                                  255, 34, 138, 250),
                                              child: IconButton(
                                                icon: const Icon(
                                                  Icons.arrow_back,
                                                  color: Color.fromARGB(
                                                      255, 253, 253, 253),
                                                ),
                                                onPressed: skickaTillbaka,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                : Center(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text(
                              "Your Result Is: ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 25),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 30.0),
                            child: SizedBox(
                              width: 350,
                              child: Card(
                                color: Colors.white,
                                elevation: 15,
                                child: Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        "${widget.message3} ",
                                        style: const TextStyle(fontSize: 30),
                                        textAlign: TextAlign.center,
                                      ),
                                      Text(
                                        "${double.parse(widget.bmi.toStringAsFixed(1))}",
                                        // this.result == null ? 'No Result' : result.toStringAsFixed(2),
                                        style: const TextStyle(fontSize: 50),
                                        textAlign: TextAlign.center,
                                      ),
                                      const SizedBox(
                                        height: 30,
                                      ),
                                      Text("${widget.message2}"),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Material(
                                          child: CircleAvatar(
                                            radius: 30,
                                            backgroundColor: Color.fromARGB(
                                                255, 34, 138, 250),
                                            child: IconButton(
                                              icon: const Icon(
                                                Icons.arrow_back,
                                                color: Color.fromARGB(
                                                    255, 253, 253, 253),
                                              ),
                                              onPressed: skickaTillbaka,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ))
        : isLandscape
            ? CupertinoPageScaffold(
                backgroundColor: Colors.amberAccent,
                navigationBar: const CupertinoNavigationBar(
                  middle: Text(
                    "Results",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Colors.black),
                  ),
                  backgroundColor: Color.fromARGB(255, 132, 250, 81),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: SingleChildScrollView(
                    child: Center(
                      child: Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Text(
                              "Your Result Is: ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                  color: Colors.black),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: SizedBox(
                              width: 350,
                              child: Card(
                                color: Colors.white,
                                elevation: 15,
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        "${widget.message3} ",
                                        style: const TextStyle(fontSize: 30),
                                        textAlign: TextAlign.center,
                                      ),
                                      Text(
                                        "${double.parse(widget.bmi.toStringAsFixed(1))}",
                                        // this.result == null ? 'No Result' : result.toStringAsFixed(2),
                                        style: const TextStyle(fontSize: 50),
                                        textAlign: TextAlign.center,
                                      ),
                                      const SizedBox(
                                        height: 30,
                                      ),
                                      Text("${widget.message2}"),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: ElevatedButton(
                                          onPressed: skickaTillbaka,
                                          child: const Text("Recalculate"),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            : CupertinoPageScaffold(
                backgroundColor: Colors.amberAccent,
                navigationBar: const CupertinoNavigationBar(
                  middle: Text(
                    "Results",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Colors.black),
                  ),
                  backgroundColor: Color.fromARGB(255, 132, 250, 81),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(50.0),
                          child: Text(
                            "Your Result Is: ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                                color: Colors.black),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 40.0),
                          child: SizedBox(
                            width: 350,
                            child: Card(
                              color: Colors.white,
                              elevation: 15,
                              child: Padding(
                                padding: const EdgeInsets.all(20),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      "${widget.message3} ",
                                      style: const TextStyle(fontSize: 30),
                                      textAlign: TextAlign.center,
                                    ),
                                    Text(
                                      "${double.parse(widget.bmi.toStringAsFixed(1))}",
                                      // this.result == null ? 'No Result' : result.toStringAsFixed(2),
                                      style: const TextStyle(fontSize: 50),
                                      textAlign: TextAlign.center,
                                    ),
                                    const SizedBox(
                                      height: 30,
                                    ),
                                    Text("${widget.message2}"),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(30.0),
                                      child: ElevatedButton(
                                        onPressed: skickaTillbaka,
                                        child: const Text("Recalculate"),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
  }
}
