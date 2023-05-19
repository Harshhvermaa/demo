import 'package:flutter/material.dart';

class Question {
  final int id;
  final String text;
  final List<String> options;

  Question({required this.id, required this.text, required this.options});
}

class QuestionList extends StatefulWidget {
  @override
  _QuestionListState createState() => _QuestionListState();
}

class _QuestionListState extends State<QuestionList> {
  List<Question> questions = [
    Question(
      id: 1,
      text: "What is your favorite color?",
      options: ["Red", "Blue", "Green", "Black"],
    ),
    Question(
      id: 2,
      text: "What is your favorite animal?",
      options: ["Dog", "Cat", "Bird"],
    ),
    Question(
      id: 3,
      text: "Do you like cricket?",
      options: ["Yes", "No"],
    ),
    Question(
      id: 4,
      text: "What is your favorite Sport?",
      options: ["Cricket", "Football", "Hockey"],
    ),
    Question(
      id: 5,
      text: "What is your favorite Animal?",
      options: ["Lion", "Panda", "Tiger", "Horse"],
    ),

  ];

  int currentQuestionIndex = 0;
  Map<int, String> answers = {};

  void selectOption(String option) {
    setState(() {
      answers[questions[currentQuestionIndex].id] = option;
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quiz"),
      ),
      body: currentQuestionIndex < questions.length
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    "${questions[currentQuestionIndex].id}. ${questions[currentQuestionIndex].text}",
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
                Column(
                  children:
                      questions[currentQuestionIndex].options.map((option) {
                    return RadioListTile(
                      title: Text(option),
                      value: option,
                      groupValue: answers[questions[currentQuestionIndex].id],
                      onChanged: (value) {
                        selectOption(value as String);
                      },
                    );
                  }).toList(),
                ),
              ],
            )
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Quiz complete!"),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        currentQuestionIndex = 0;
                        answers.clear();
                      });
                    },
                    child: Text("Restart Quiz"),
                  ),
                ],
              ),
            ),
    );
  }
}
