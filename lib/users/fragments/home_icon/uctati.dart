import 'package:flutter/material.dart';

class UCTATI extends StatefulWidget {
  const UCTATI({super.key});

  @override
  State<UCTATI> createState() => _UCTATIState();
}

class _UCTATIState extends State<UCTATI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.yellow.shade600,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          ),
          
          body: SingleChildScrollView(
            child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            
            children: [

              const SizedBox(height: 40),

              SizedBox(
                child: Image.asset('lib/images/tati 30.png',
                height: MediaQuery.of(context).size.height / 7,
                ),
              ),
              
              const SizedBox(height: 40),
                
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
        
                  child: const Text.rich(
                    TextSpan(
                      children: [    
                        TextSpan(text: 'Vision:\n', 
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        
                        TextSpan(text: 'To be an excellent technology based educational institution and to nurture future leaders.\n\n', 
                        style: TextStyle(fontSize: 18),
                        ),
        
                        TextSpan(text: 'Mission:\n', 
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
        
                        TextSpan(text: 'To provide high-quality student-centered education and produced holistic talents with strong technological and leadership skills.\n\n', 
                        style: TextStyle(fontSize: 18),
                        ),
              
                        TextSpan(text: 'Motto:\n', 
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
              
                        TextSpan(text: 'Inspiring Future Leaders\n\n', 
                        style: TextStyle(fontSize: 18),
                        ),
              
                        TextSpan(text: 'Objectives:\n', 
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
              
                        TextSpan(text: 
                        '• To produce highly skilled human capital based on the latest technology\n• To produce creative and innovative individuals\n• To inculcate lifelong learning\n• To imbibe sustainable development\n', 
                        style: TextStyle(fontSize: 18),
                        ),
        
                      ],
                    ),
                    
                    textAlign: TextAlign.justify,
                  ),
                ),
              ],
        ),
        ),
    );
  }
}
        
       