import 'package:flutter/material.dart';
import 'package:minor_project/screens/home/ask_question.dart';
import 'package:minor_project/screens/home/question_list.dart';

class DepartmentQuestions extends StatefulWidget {
  String department;

  DepartmentQuestions({this.department});

  @override
  _DepartmentQuestionsState createState() => _DepartmentQuestionsState();
}

class _DepartmentQuestionsState extends State<DepartmentQuestions> {
  final Map<String, String> tagsToDept = {
    'cse': 'Computer Science Engineering',
    'eee': 'Electrical & Electronics Engineering',
    'ipe': 'Industrial & Production Engineering',
    'ise': 'Information Science Engineering',
    'mca': 'Master of Computer Applications',
    'mat': 'Mathematics',
    'phy': 'Physics',
    'che': 'Chemistry',
    'ece': 'Electronics & Communication Engineering',
    'me': 'Mechanical Engineering',
    'ce': 'Civil Engineering',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(tagsToDept[widget.department]),
      ),
      body: QuestionList(
        tagsToFilter: [widget.department],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AskQuestion(dept: widget.department),
            ),
          );
        },
      ),
    );
  }
}
