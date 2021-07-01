import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:minor_project/models/question.dart';
import 'package:minor_project/models/user.dart';
import 'package:minor_project/screens/home/question_list.dart';
import 'package:minor_project/services/auth_service.dart';
import 'package:minor_project/services/database.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // final AuthService _authInstance = AuthService();

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: Text('NIE AnswerHub'),
  //     ),
  //     body: Center(
  //       child: ElevatedButton(
  //         child: Text('Sign Out'),
  //         onPressed: () async {
  //           String msg = await _authInstance.signOut();
  //           print(msg);
  //         },
  //       ),
  //     ),
  //     bottomNavigationBar: BottomNavigationBar(
  //       items: [
  //         BottomNavigationBarItem(
  //           icon: Icon(Icons.home),
  //           label: 'Home',
  //         ),
  //         BottomNavigationBarItem(
  //           icon: Icon(Icons.search),
  //           label: 'Search',
  //         ),
  //         BottomNavigationBarItem(
  //           icon: Icon(Icons.account_circle),
  //           label: 'Profile',
  //         ),
  //       ],
  //     ),
  //   );
  // }

  final _authInstance = AuthService();
  final _formkey = GlobalKey<FormState>();

  final questionController = TextEditingController();
  final tagsController = TextEditingController();

  var currentIndex = 0;

  List<dynamic> _processInputTags(String tags) {
    tags = tags.trim();
    List<dynamic> tagsList = tags.split('#');
    tagsList = tagsList.sublist(1);
    // print(tagsList);
    return tagsList;
  }

  void clearInputs() {
    questionController.text = '';
    tagsController.text = '#general';
  }

  @override
  Widget build(BuildContext context) {
    final uid = Provider.of<String>(context);
    this.tagsController.text = '#general';

    final _dbService = new DatabaseService(uid: uid);

    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        actions: [
          TextButton(
            child: Icon(Icons.account_box_rounded),
            onPressed: () async {
              await _authInstance.signOut();
            },
          ),
        ],
      ),
      body: QuestionList(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet<void>(
            context: context,
            builder: (BuildContext context) {
              return Form(
                key: this._formkey,
                child: Container(
                  height: 200,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Center(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            TextFormField(
                              controller: questionController,
                              keyboardType: TextInputType.multiline,
                              maxLines: null,
                              validator: (value) =>
                                  value == '' ? 'Enter a question' : null,
                              decoration: InputDecoration(
                                labelText: 'Question',
                              ),
                            ),
                            TextFormField(
                              controller: tagsController,
                              validator: (value) =>
                                  value == '' ? 'Enter appropriate tags' : null,
                              decoration: InputDecoration(
                                  labelText: 'Tags',
                                  hintText: 'Eg: #general #year3 etc'),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextButton(
                                  child: Text('Cancel'),
                                  onPressed: () {
                                    Navigator.pop(context);
                                    questionController.text = '';
                                    tagsController.text = '#general';
                                  },
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                ElevatedButton(
                                  child: Text('Ask Question'),
                                  onPressed: () async {
                                    if (this._formkey.currentState.validate()) {
                                      final List<dynamic> tagsList =
                                          _processInputTags(
                                              tagsController.text);
                                      Question question = new Question(
                                          question: questionController.text,
                                          tags: tagsList);
                                      Navigator.pop(context);
                                      await _dbService.addQuestion(question);
                                      questionController.text = '';
                                      tagsController.text = '#general';
                                    }
                                  },
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
            },
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: this.currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            // title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
            // title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fireplace),
            label: 'Dept',
            // title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
            // title: Text('Home'),
          ),
        ],
        onTap: (index) {
          setState(() {
            this.currentIndex = index;
          });
          print('Index pressed: $index');
        },
      ),
    );
  }
}
