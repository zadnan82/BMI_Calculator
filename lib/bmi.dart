import 'package:bmi_calculator/modell.dart';
import "package:flutter/material.dart"; 
import 'dart:math';

class BMI extends StatefulWidget {
 //  
 BMI({Key? key, required this.bmi , required this.message2 , required this.message3}) : super(key: key);

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
 


void skickaTillbaka(){


  // widget.addToList;
  // widget.reset; 
  Navigator.of(context).pop();
}



  @override
  Widget build(BuildContext context) {
    return Column( 

      
      children: [

        
                Padding(
                  padding: const EdgeInsets.all(20.0),
                   
                  child: Text("Your Result Is: ", style: TextStyle(fontWeight: FontWeight.bold , fontSize: 25),),
                ), 
                
                   Padding(
                     padding: const EdgeInsets.only(top : 40.0),
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
                          Text("${widget.message3} ",
                      style: const TextStyle(fontSize: 30),
                      textAlign: TextAlign.center,
                    ),

                       
                       
                         Text("${double.parse(widget.bmi.toStringAsFixed(1))}",
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
                     ) , 
                   ), 
    
                    
              
                



       

                    

       
      ],
    
    ); 
  }
}
