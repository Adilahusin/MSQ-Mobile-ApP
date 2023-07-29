import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class QuizFragment extends StatefulWidget {
  const QuizFragment({super.key});

  @override
  State<QuizFragment> createState() => _QuizFragmentState();
}

class _QuizFragmentState extends State<QuizFragment> {

  List _questions = [];
  bool _isLoading = true;

  final List<Map<String, dynamic>> _getAnswerChoices = [
    {"label": "Very Satisfied", "value" : "1"},
    {"label": "Satisfied", "value" : "2"},
    {"label": "Neutral", "value" : "3"},
    {"label": "Dissatisfied", "value" : "4"},
    {"label": "Very Dissatisfied", "value" : "5"}
    ]; 

    String? _selectedAnswerChoices;

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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow.shade600,
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
                  
                  for(int i = 0; i < _getAnswerChoices.length; i++)
                  Row(
                    children: [
                      Radio<dynamic>(
                        value: _getAnswerChoices[i]['value'],
                        activeColor: Colors.orange,
                        groupValue: _selectedAnswerChoices,
                        onChanged: (value) {
                          setState(() {
                            _selectedAnswerChoices = value.toString();
                            });

                            // add insert to database here
                            },
                      ),
                      
                      Text(_getAnswerChoices[i]['label']),
                    ],
                  ),

                  ],
                ),
              );
          }),
        ),


    );
  }
}



