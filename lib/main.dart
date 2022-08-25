import 'package:bmi_calculator/bmi.dart';
import 'package:bmi_calculator/bmi_list.dart';
import "package:flutter/material.dart";
import 'modell.dart';
import 'dart:math';

 
void main() {
 runApp(MyApp());
}
 
class MyApp extends StatelessWidget {
 @override
 Widget build(BuildContext context) {
 return MaterialApp(
 theme: ThemeData(primarySwatch: Colors.blue),
 title: "It Högskolan Flutter App",
 home: MyHomePage(),
 );
 }
}
 
class MyHomePage extends StatefulWidget {
  
  
 @override
 State<MyHomePage> createState() => _MyHomePageState();
}
 
class _MyHomePageState extends State<MyHomePage> {

   List bmiListan = [] ; 

double ? bmi ; 

final lengthController = TextEditingController();
final weightController = TextEditingController();  

final data = Modellen(length: 0.0, weight : 0.0, bmi : 0.0 , genders : false );

String message = "Please enter your length and weight!";

String message2 = "";
String message3 = "";

String? gender ; 

int listCounter  = 0 ; 


void startCalculator(BuildContext context){
 

                
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BMI(bmi: bmi! , message2: message2 , message3 : message3 ),
                ),
              );
            
    
}


void showList(BuildContext context){
 
         showModalBottomSheet(context: context , builder: (_) => GestureDetector(
    child: BMIList(bmiListan),));            
}
void reset(){
  setState(() {

    bmiListan = [];

  });
}

void addToList (double bmi){
 
  setState(() {
    bmiListan.add(bmi);
  });
}

void increaseListCounter(){
 setState(() {
   listCounter = 1 ;
  });


}

void resetListCounter(){
 setState(() {
   listCounter = 0 ;
  });

}

void calculate (){
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
 return  Scaffold(
        backgroundColor: Color.fromARGB(255, 132, 250, 81),
        body: listCounter == 0
          ?  

          
        Center(

          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text("Welcome to BMI Calculator", style: TextStyle(fontWeight: FontWeight.bold , fontSize: 25),),
                ), 
                
                   Padding(
                     padding: const EdgeInsets.only(top : 20.0),
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
                        TextField(
                          keyboardType:
                              const TextInputType.numberWithOptions(decimal: true),
                          decoration:
                              const InputDecoration(labelText: "Height (m)"),
                          controller: lengthController,
                        ),
                        TextField(
                          keyboardType:
                              const TextInputType.numberWithOptions(decimal: true),
                          decoration: const InputDecoration(
                            labelText: "Weight (kg)",
                          ),
                          controller: weightController,
                        ),


            RadioListTile(
          title: const Icon(
                                Icons.male,
                                size: 20,
                                color: false  
                                ? Color.fromARGB(255, 241, 65, 206)
                                : Colors.blue,
                            ),
          value: "male", 
          groupValue: gender, 
          onChanged: (value){
            setState(() {
                gender = value.toString();
            });
          },
      ),

          
      RadioListTile(
          title: const Icon(
                                Icons.female,
                                size: 20,
                                color: true  
                                ? Color.fromARGB(255, 241, 65, 206)
                                : Colors.blue,
                              
                            ),
          value: "female", 
          groupValue: gender, 
          onChanged: (value){
            setState(() {
                gender = value.toString();
            });
          },
      ),
                  

Text(gender == "male" ? "Hello gentleman!" : "Hi lady!"), 


                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: ElevatedButton(
                            onPressed: calculate,
                            child: const Text("Calculate"),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        
                        const SizedBox(
                          height: 20,
                      
                        ),
                        Text(
                          message,
                          textAlign: TextAlign.center,
                        ), 
                        

                        Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: ElevatedButton(
                            onPressed: reset,
                            child: const Text("Delete list of saved BMI's"),
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

         
          )

        
          
         
        ) : 
         
         Flex(direction: Axis.vertical,
         children: <Widget>[
           Flexible(
        flex: 1,
        child:      ListView.builder(
      itemCount: bmiListan.length,
      itemBuilder:  (context, index) {
        return Padding(
                padding:  EdgeInsets.only(bottom: 60),
                child: Card(
                  elevation:  5,
                  child: Column( 
                    children: [
                    Text("${double.parse(bmiListan[index].toStringAsFixed(1))}",
                           // this.result == null ? 'No Result' : result.toStringAsFixed(2),
                            style: const TextStyle(fontSize: 50),
                            textAlign: TextAlign.center,
                            
                          ),
                  ],)
                   
                  
                ),
                 
                
        );
        
      } ,
      
    ),
        ),

        ElevatedButton(onPressed: resetListCounter, child: Icon(Icons.arrow_back),),
         ],
         ),
          
          
              
            
              

           // floatingActionButton: FloatingActionButton(onPressed: resetListCounter, child:  Icon(Icons.arrow_back),) ,
           
    
         


         floatingActionButton: FloatingActionButton(onPressed: () => increaseListCounter(), child: Icon(Icons.list),),

    
    

  // BMIList(bmiListan);
  

        );
      
  }
}
