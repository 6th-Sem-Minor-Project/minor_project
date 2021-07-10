import 'package:flutter/material.dart';
import 'package:minor_project/models/question.dart';
import 'package:minor_project/services/database.dart';
import 'package:provider/provider.dart';

class AskQuestion extends StatefulWidget {
  String dept;
  Question question = null;

  AskQuestion({this.dept, this.question});

  @override
  _AskQuestionState createState() => _AskQuestionState();
}

class _AskQuestionState extends State<AskQuestion> {
  final _formKey = GlobalKey<FormState>();

  List<dynamic> _processInputTags(String tags) {
    tags = tags.trim();
    List<dynamic> tagsList = tags.split('#');
    tagsList = tagsList.sublist(1);
    // print(tagsList);
    return tagsList;
  }

  String _processListTagsToString(List<dynamic> tags) {
    String tagString = tags.join('#');
    print(tagString);
    return '#' + tagString;
  }

  @override
  Widget build(BuildContext context) {
    String uid = Provider.of<String>(context);
    DatabaseService _db = new DatabaseService(uid: uid);
    TextEditingController questionController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();
    TextEditingController tagsController = TextEditingController();

    if (widget.dept == 'general') {
      tagsController.text = '#general';
    } else {
      tagsController.text = widget.dept;
    }

    if (widget.question != null) {
      questionController.text = widget.question.question;
      descriptionController.text = widget.question.description;
      tagsController.text = _processListTagsToString(widget.question.tags);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Ask Question...'),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: Form(
          key: _formKey,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  Text(
                    'Question: ',
                    style: TextStyle(fontWeight: FontWeight.w900),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Type your question here...',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) =>
                        value == '' ? 'This field cannot be empty' : null,
                    controller: questionController,
                    maxLines: null,
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Description: ',
                    style: TextStyle(fontWeight: FontWeight.w900),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText:
                          'A breif description of your question... (Optional)',
                      border: OutlineInputBorder(),
                    ),
                    maxLines: null,
                    controller: descriptionController,
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Tags: ',
                    style: TextStyle(fontWeight: FontWeight.w900),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        helperText:
                            'Enter space separated tags relavant to your question'),
                    validator: (value) =>
                        value == '' ? 'Enter appropriate tags' : null,
                    controller: tagsController,
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          child: Text(widget.question != null
                              ? 'Edit Question'
                              : 'Ask Question!'),
                          onPressed: () async {
                            if (_formKey.currentState.validate()) {
                              List<dynamic> finalTagsList =
                                  _processInputTags(tagsController.text);
                              Question question = new Question(
                                question: questionController.text,
                                description: descriptionController.text,
                                tags: finalTagsList,
                                userId: uid,
                              );
                              if (widget.question != null) {
                                widget.question.question =
                                    questionController.text;
                                widget.question.description =
                                    descriptionController.text;
                                widget.question.tags =
                                    _processInputTags(tagsController.text);
                                await _db.updateQuestion(widget.question);
                              } else {
                                await _db.addQuestion(question);
                              }
                              Navigator.pop(context);
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
