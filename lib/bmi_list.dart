import 'package:bmi_calculator/modell.dart';
import "package:flutter/material.dart";


class BMIList extends StatelessWidget {
  
  final List  listan ; 

  BMIList(this.listan);


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: listan.length,
      itemBuilder:  (context, index) {
        return Padding(
          padding:  EdgeInsets.only(bottom: 60),
          child: Card(
            elevation:  5,
            child: Column( 
              children: [
              Text("${double.parse(listan[index].toStringAsFixed(1))}",
                     // this.result == null ? 'No Result' : result.toStringAsFixed(2),
                      style: const TextStyle(fontSize: 50),
                      textAlign: TextAlign.center,
                      
                    ),
            ],)
             
            
          ),
           
        );
        
      } ,
      
    );
    
  }
}
