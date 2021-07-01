import 'package:minor_project/models/user.dart';
import 'package:minor_project/screens/answers/submit_answer.dart';
import 'package:minor_project/utils/functions/functions.dart';
import 'package:provider/provider.dart';
import '../../models/answer.dart';
import 'package:flutter/material.dart';

class AnswerCard extends StatefulWidget {
  final Answer answer;

  AnswerCard(this.answer);

  @override
  _AnswerCardState createState() => _AnswerCardState();
}

class _AnswerCardState extends State<AnswerCard> {
  @override
  Widget build(BuildContext context) {
    List<UserModel> userProfiles = Provider.of<List<UserModel>>(context);
    String currentUser = Provider.of<String>(context);
    UserModel userAnswered = null;
    bool isAnsweredByCurrentUser = currentUser == widget.answer.userId;
    if (userProfiles != null) {
      userAnswered =
          Functions.getUserDetails(userProfiles, widget.answer.userId);
    }
    return Container(
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                  child: Icon(
                    Icons.account_circle,
                    size: 30,
                  ),
                ),
                Text(
                  isAnsweredByCurrentUser ? 'Me' : userAnswered.name,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Expanded(
                  child: SizedBox(),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Divider(),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.answer.answer,
                style: TextStyle(),
              ),
            ),
            isAnsweredByCurrentUser
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                          child: Text('Edit Answer'),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SubmitAnswer(
                                          answer: widget.answer,
                                          isEditingExistingAnswer: true,
                                        )));
                          }),
                    ],
                  )
                : SizedBox(),
          ],
        ),
      ),
    );
  }
}
