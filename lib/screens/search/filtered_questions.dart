import 'package:flutter/material.dart';
import 'package:minor_project/screens/home/question_list.dart';

class FilteredQuestions extends StatefulWidget {
  List<dynamic> tagsToFilter;

  FilteredQuestions({this.tagsToFilter});

  @override
  _FilteredQuestionsState createState() => _FilteredQuestionsState();
}

class _FilteredQuestionsState extends State<FilteredQuestions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Filtered Questions')),
      body: QuestionList(tagsToFilter: widget.tagsToFilter),
    );
  }
}
