import '../../models/question.dart';
import './question_tile.dart';
import '../../utils/spinner/loading_spinner.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class QuestionList extends StatefulWidget {
  @override
  _QuestionListState createState() => _QuestionListState();
}

class _QuestionListState extends State<QuestionList> {
  @override
  Widget build(BuildContext context) {
    final questions = Provider.of<List<Question>>(context);
    bool loading = true;

    if (questions != null) {
      setState(() {
        loading = false;
      });
    }
    return loading
        ? Loading()
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
