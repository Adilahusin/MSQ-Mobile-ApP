import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:msq_mysql/users/fragments/Quiz.dart';
import 'package:msq_mysql/users/fragments/startQuiz.dart';

import 'home_icon/suggestions.dart';


void main(){
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent
  ));
}

class QuizHomeFragment extends StatefulWidget {
  const QuizHomeFragment({super.key});

  @override
  State<QuizHomeFragment> createState() => _QuizHomeFragmentState();
}

class _QuizHomeFragmentState extends State<QuizHomeFragment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.yellow.shade600,
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(50),
              ),
            ),
            
            child: Column(
              children: [
                 const SizedBox(height: 50),
                 ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 30),
                  title: Text('MSQ Mobile Application',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),),
                 ),
              ],
            ),
          ),       
          
          SizedBox(
                child: Image.asset('lib/images/6.png',
                height: 300),
              ),
              
              const SizedBox(height: 20),

               Column(
                children: [
                  
                  // Start quiz button
                  ElevatedButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) => const QuizFragment(),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              fixedSize: const Size(200, 50),
                              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                              backgroundColor: Colors.yellow[600],
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                                ),
                            ),
                            child: const Text(
                              'Start Quiz',
                              style: TextStyle(fontSize: 18),
                            ),
                          ),

                          const SizedBox(height: 20),
                          
                          // History button
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) => const Suggestions(),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              fixedSize: const Size(200, 50),
                              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                              backgroundColor: Colors.yellow[600],
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                                
                                child: const Text(
                                  'History',
                                  style: TextStyle(fontSize: 18),
                                  ),
                                ),

            ],
          ),
        ],
      ),
    );
  }
}