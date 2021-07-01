import 'package:flutter/material.dart';
import 'package:minor_project/models/answer.dart';
import 'package:minor_project/screens/answers/answer_card.dart';

class AnswerList extends StatefulWidget {
  List<Answer> answers;

  AnswerList(this.answers);

  @override
  _AnswerListState createState() => _AnswerListState();
}

class _AnswerListState extends State<AnswerList> {
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: double.infinity, minHeight: 200),
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (item, index) {
          return AnswerCard(widget.answers[index]);
        },
        itemCount: widget.answers.length,
      ),
    );
  }
}
