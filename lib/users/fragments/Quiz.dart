import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:msq_mysql/users/fragments/quiz_fragment.dart';
import 'dart:convert';

import '../model/answer_data.dart';

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {

  final List<Map<String, Object>> _answers = answers ;
  var questionIndex;
  var totalScore;

  List _questions = [];
  bool _isLoading = true;

  Future _getQuestions() async {
    try {
      final resQuestion = await http.get(Uri.parse('http://10.30.3.6/api_msq_app/questions/viewQuestions.php'));
      if(resQuestion.statusCode==200) {
        final questions = jsonDecode(resQuestion.body);
        setState(() {
          _questions = questions;
          _isLoading = false;
        });
      }

    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    _getQuestions();
    super.initState();

    questionIndex = 0;
    totalScore = 0;
  }

  void answerQuestion(int score) {
    setState(() {
      totalScore += score;
      questionIndex++;
    });
  }

  void submitQuiz() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Quiz Result'),
          content: Text('Your total score is $totalScore.'),
          actions: [
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz'),
      ),

      body: _isLoading 
          ? const Center(child: CircularProgressIndicator(),
          )
          : ListView.builder(
            itemCount: _questions.length,
            itemBuilder: ((context, index){
              return Card(
                child: 
                Column(
                  children: <Widget>[
                
                ListTile(
                  title: Text(_questions[index]['question']),
                  ),

                  const SizedBox(height: 30),

                ...(answers[questionIndex]['answers'] as List<Map<String, Object>>).map((answer) {
                  return GestureDetector(
                    onTap: () {
                      answerQuestion(answer['score'] as int);
                      print(answer['score']);
                  // add the response to database here
                },
                
                // Answer choices UI
                child: Center(
                  child: Container(
                    height: 40,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                        Color.fromARGB(255, 251, 192, 42),
                        Color.fromARGB(255, 247, 204, 96),
                      ])
                    ),
                    
                    width: MediaQuery.of(context).size.width * 0.9, // Set width to 90% of screen width
                    margin: const EdgeInsets.symmetric(vertical: 10), // Add vertical spacing of 10 units
                    child: Center(child: Text(answer['text'] as String)),
                  ),
                ),
              );
              }),

              const SizedBox(height: 20),
              ],
            
            
          
          // // Result UI
          // child: Column(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     const Text(
          //       'Quiz Completed!',
          //       style: TextStyle(fontSize: 24),
          //     ),

          //     const SizedBox(height: 20),

          //       const Text(
          //           'Your score is :',
          //           style: TextStyle(fontSize: 20),
          //        ),

          //        const SizedBox(height: 10),

          //       Text(
          //         '${totalScore.toString()}/100',
          //           style: const TextStyle(
          //             fontSize: 35,
          //             fontWeight: FontWeight.bold),
          //       ),
                    

          //     const SizedBox(height: 20),

          //     Container(
          //       padding: const EdgeInsets.all(16.0),
          //       decoration: BoxDecoration(
          //         border: Border.all(width: 3, color: Colors.yellow.shade700),
          //       ),
          //       child: const Text(
          //           "75 or higher - High level of satisfaction\n"
          //           "26 - 74 - Average level of satisfaction\n"
          //           "25 or lower - Medium level of satisfaction",
          //           style: TextStyle(fontSize: 16),
          //       ),
          //     ),

          //   const SizedBox(height: 20),

          //   // Restart Button
          //   TextButton(
          // onPressed: () {
          //   Navigator.push(
          //     context, MaterialPageRoute(builder: (context) => const QuizHomeFragment()));
          // },

          //   child: Container(
          // color: Colors.yellow[700],
          // padding: const EdgeInsets.all(14),
          // child: const Text(
          //   'Restart Quiz',
          //   style: TextStyle(
          //     color: Colors.black,
          //     fontSize: 15
          // ),
          //   ),
          // ),
          // ),
          
          // const SizedBox(height: 20),

          //   Container(
          // padding: const EdgeInsets.only(top: 50),
          // height: 220,
          // decoration: const BoxDecoration(
          //   image: DecorationImage(
          //     image: AssetImage("lib/images/tati 30.png"),
          //     fit: BoxFit.fitHeight
          //     ),
          //     ),
          //   ),

//               ],
//             ),
//                 ),
//               );
//           }),
//         ),


//     );
//   }
// }

            ),
              );
          }),
        ),


    );
  }
}

