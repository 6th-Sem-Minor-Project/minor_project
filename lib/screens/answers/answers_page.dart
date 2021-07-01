import 'package:minor_project/screens/answers/submit_answer.dart';
import '../../utils/functions/functions.dart';
import 'package:minor_project/screens/answers/answer_list.dart';
import 'package:minor_project/screens/home/edit_question.dart';
import '../../models/answer.dart';
import '../../models/question.dart';
import '../../models/user.dart';
import '../../services/database.dart';
import '../../utils/spinner/loading_spinner.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../utils/dialog/show_dialog.dart';

class AnswersPage extends StatefulWidget {
  AnswersPage({this.question});

  final Question question;

  @override
  _AnswersPageState createState() => _AnswersPageState();
}

class _AnswersPageState extends State<AnswersPage> {
  bool isAllowedToSubmitAnswer = true;

  List<Answer> filterRelaventAnswers(List<Answer> answers) {
    return answers
        .where((element) => element.qid == widget.question.id)
        .toList();
  }

  void isAllowedToAnswer(question) {
    if (question.isClosed) {
      setState(() {
        isAllowedToSubmitAnswer = false;
      });
    }
  }

  FloatingActionButton getAppropriateButton(context, uid) {
    if (widget.question.userId == uid) {
      return FloatingActionButton(
        child: Icon(Icons.edit),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => EditQuestion(widget.question)));
        },
      );
    } else {
      return FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SubmitAnswer(
                question: widget.question,
                isEditingExistingAnswer: false,
              ),
            ),
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Answer> answers = Provider.of<List<Answer>>(context);
    List<UserModel> userProfiles = Provider.of<List<UserModel>>(context);
    String uid = Provider.of<String>(context);
    UserModel questionAskedByUser = null;
    DatabaseService db = null;
    bool loading = true;

    if (answers != null && userProfiles != null && uid != null) {
      setState(() {
        loading = false;
      });
    }
    if (uid != null) {
      db = DatabaseService(uid: uid);
    }
    if (answers != null) {
      answers = filterRelaventAnswers(answers);
    }
    if (userProfiles != null) {
      questionAskedByUser =
          Functions.getUserDetails(userProfiles, widget.question.userId);
      print(questionAskedByUser.name);
    }

    isAllowedToAnswer(widget.question);

    return Scaffold(
      appBar: AppBar(
        title: Text('QnA'),
      ),
      body: loading
          ? Loading()
          : SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                      margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
                      child: Text(
                        widget.question.question,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 23.0,
                        ),
                      )),
                  Row(children: [
                    Expanded(child: Divider()),
                  ]),
                  Container(
                      margin: EdgeInsets.fromLTRB(20, 0, 20, 20),
                      child: Text(
                        widget.question.description,
                        style: TextStyle(
                          fontSize: 18.0,
                        ),
                      )),
                  SizedBox(
                    height: 5.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            questionAskedByUser.name,
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w200,
                            ),
                          ),
                          Text(
                            questionAskedByUser.usn,
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w200,
                            ),
                          ),
                        ],
                      ),
                      Icon(
                        Icons.account_box_sharp,
                        size: 40,
                      )
                    ],
                  ),
                  (questionAskedByUser.uid == uid && !widget.question.isClosed)
                      ? Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                  child: Text('Close Question'),
                                  onPressed: () {
                                    db.closeQuestion(widget.question);
                                    showMyDialog(context, 'Question Closed', 'This question is now closed!');
                                    setState(() {
                                      widget.question.isClosed = true;
                                    });
                                    // Navigator.pop(context);
                                  }),
                            ),
                          ],
                        )
                      : SizedBox(),
                  answers.isEmpty
                      ? Center(
                          child: Container(
                            child:
                                Text('No Answers yet! Be the first to answer'),
                            margin: EdgeInsets.all(30),
                          ),
                        )
                      // : Container(
                      //     height: 500,
                      //     child: AnswerList(answers),
                      //   ),
                      : AnswerList(answers),
                ],
              ),
            ),
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.add),
      //   onPressed: () {
      //     DatabaseService(uid: user.uid).getUserById();
      //   },
      // ),
      floatingActionButton: Visibility(
        child: getAppropriateButton(context, uid),
        visible: isAllowedToSubmitAnswer,
      ),
    );
  }
}
