import 'package:flutter/material.dart';
import 'package:minor_project/models/answer.dart';
import 'package:minor_project/models/question.dart';
import 'package:minor_project/services/database.dart';
import 'package:provider/provider.dart';

class SubmitAnswer extends StatefulWidget {
  Question question;
  Answer answer;
  bool isEditingExistingAnswer = false;

  SubmitAnswer({this.question, this.answer, this.isEditingExistingAnswer});

  @override
  _SubmitAnswerState createState() => _SubmitAnswerState();
}

class _SubmitAnswerState extends State<SubmitAnswer> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    TextEditingController answerController = new TextEditingController();
    List<Question> questions = Provider.of<List<Question>>(context);
    String uid = Provider.of<String>(context);
    DatabaseService db = new DatabaseService();

    if (widget.answer != null) {
      answerController.text = widget.answer.answer;
      if (questions != null) {
        widget.question = questions
            .where((question) => question.id == widget.answer.qid)
            .toList()[0];
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: widget.isEditingExistingAnswer
            ? Text('Edit Answer')
            : Text('Submit Answer'),
      ),
      body: Form(
        key: _formKey,
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  child: Text(
                    'Question: ' + widget.question.question,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  // margin: EdgeInsets.symmetric(vertical: 5),
                  padding: EdgeInsets.all(10)),
              Row(
                children: [
                  Expanded(
                    child: Divider(),
                  ),
                ],
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Type your answer here...',
                  border: OutlineInputBorder(),
                ),
                validator: (value) =>
                    value == '' ? 'Answer cannot be empty' : null,
                controller: answerController,
                maxLines: null,
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                        child: widget.isEditingExistingAnswer
                            ? Text('Edit Answer')
                            : Text('Submit Answer'),
                        onPressed: () {
                          print(answerController.text);
                          if (_formKey.currentState.validate()) {
                            Answer submittedAnswer = new Answer(
                              answer: answerController.text,
                              qid: widget.question.id,
                              userId: uid,
                              id: widget.isEditingExistingAnswer
                                  ? widget.answer.id
                                  : null,
                            );
                            if (widget.isEditingExistingAnswer) {
                              db.updateAnswer(submittedAnswer);
                            } else {
                              db.addAnswer(submittedAnswer);
                            }
                            Navigator.pop(context);
                          }
                        }),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
