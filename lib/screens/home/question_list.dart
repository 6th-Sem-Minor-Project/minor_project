import '../../models/question.dart';
import './question_tile.dart';
import '../../utils/spinner/loading_spinner.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class QuestionList extends StatefulWidget {
  List<dynamic> tagsToFilter;

  QuestionList({this.tagsToFilter});

  @override
  _QuestionListState createState() => _QuestionListState();
}

class _QuestionListState extends State<QuestionList> {
  List<Question> getFilteredQuestions(
      List<Question> questionList, Set<dynamic> tagsToFilter) {
    return questionList
        .where((question) =>
            question.tags.toSet().intersection(tagsToFilter).length >= 1)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    List<Question> questions = Provider.of<List<Question>>(context);
    Set<dynamic> tagSet = widget.tagsToFilter.toSet();

    bool loading = true;

    if (questions != null) {
      setState(() {
        loading = false;
      });
    }

    if (questions != null) {
      questions = getFilteredQuestions(questions, tagSet);
    }
    return loading
        ? Loading()
        : questions.length == 0
            ? Center(
                child: Text('Be the first to ask a question...'),
              )
            : ListView.builder(
                itemBuilder: (context, index) {
                  return QuestionTile(questions[index]);
                },
                itemCount: questions.length,
              );
    // return Container(
    //   child: Text('HEllo'),
    // );
  }
}
