import 'package:bmi_calculator/modell.dart';
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'modell.dart';
import 'dart:math';
import 'dart:io';

class BMIList extends StatefulWidget {
  List listan;
  final Function emptyList;
  BMIList(this.listan, this.emptyList);

  @override
  State<BMIList> createState() => _BMIList();
}

class _BMIList extends State<BMIList> {
  void resetit() {
    setState(() {
      widget.listan = [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: Colors.amberAccent,
      navigationBar: CupertinoNavigationBar(
        middle: const Text(
          "BMI List",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 25, color: Colors.black),
        ),
        trailing: CupertinoButton(
          padding: const EdgeInsets.all(10),
          onPressed: () {
            resetit();
          },
          child: const Text("Delete"),
        ),
        backgroundColor: const Color.fromARGB(255, 132, 250, 81),
      ),
      child: Flex(
        direction: Axis.vertical,
        children: <Widget>[
          Flexible(
            flex: 1,
            child: ListView.builder(
              itemCount: widget.listan.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(bottom: 60),
                  child: Card(
                      elevation: 5,
                      child: Column(
                        children: [
                          Text(
                            "${double.parse(widget.listan[index].toStringAsFixed(1))}",
                            // this.result == null ? 'No Result' : result.toStringAsFixed(2),
                            style: const TextStyle(fontSize: 50),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      )),
                );
              },
            ),
          ),
          // ElevatedButton(
          //   onPressed: resetListCounter,
          //   child: Icon(Icons.arrow_back),
          // ),
        ],
      ),
    );
  }
}
