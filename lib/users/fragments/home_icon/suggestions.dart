import 'package:flutter/material.dart';

class Suggestions extends StatefulWidget {
  const Suggestions({super.key});

  @override
  State<Suggestions> createState() => _SuggestionsState();
}

class _SuggestionsState extends State<Suggestions> {
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
        
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            
            children: [
              
              SizedBox(
                height: MediaQuery.of(context).size.height / 2,
                child: Image.asset('lib/images/suggestions.png'),
              ),
              
              const SizedBox(height: 20),
                
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
        
                  child: const Text.rich(
                    TextSpan(
                      children: [    
                        TextSpan(
                          text: 'Any suggestions for enhancement or questions about this application, please email them to ', 
                          style: TextStyle(fontSize: 18),
                        ),
                        
                        TextSpan(
                          text: 'adilahusin4@gmail.com', 
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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


