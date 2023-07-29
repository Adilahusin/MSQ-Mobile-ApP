import 'package:flutter/material.dart';

class Guidelines extends StatefulWidget {
  const Guidelines({super.key});

  @override
  State<Guidelines> createState() => _GuidelinesState();
}

class _GuidelinesState extends State<Guidelines> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(  
        appBar: AppBar(
          backgroundColor: Colors.yellow.shade600,
        ), 
        
        body: Container(  
          padding: const EdgeInsets.all(50),  
          margin: const EdgeInsets.all(40),  
          decoration: BoxDecoration(  
            border: Border.all(color: Colors.black, width: 2),  
            borderRadius: BorderRadius.circular(8),  
            boxShadow: [  
              BoxShadow(color: Colors.yellow.shade600, offset: const Offset(6.0, 6.0),),  
            ],  
          ),  
          
          child: const Text.rich(
            TextSpan(
              children: [
                TextSpan(text: 'GUIDELINES\n\n', 
                style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold, 
                decoration: TextDecoration.underline),
                ),
                
                TextSpan(text: 'STEP 1 ', 
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),

                TextSpan(text: 'Click the Quiz tab to go to Quiz Main Page\n\n', 
                style: TextStyle(fontSize: 18),
                ),

                TextSpan(text: 'STEP 2 ', 
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),

                TextSpan(text: 'Click the Start Quiz button to start answering\n\n', 
                style: TextStyle(fontSize: 18),
                ),

                TextSpan(text: 'STEP 3 ', 
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),

                TextSpan(text: 'Once finish answering, score will automatically calculated\n\n', 
                style: TextStyle(fontSize: 18),
                ),

              ],
            ),
            ),
        ),  
    );  
  }  
}  