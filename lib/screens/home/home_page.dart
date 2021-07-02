import 'package:flutter/material.dart';
import 'package:minor_project/screens/home/ask_question.dart';
import 'package:minor_project/screens/home/question_list.dart';
import 'package:minor_project/screens/search/search.dart';
import 'package:minor_project/services/auth_service.dart';
import 'package:minor_project/services/database.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  final _authInstance = AuthService();
  final _formkey = GlobalKey<FormState>();

  final questionController = TextEditingController();
  final tagsController = TextEditingController();

  var currentIndex = 0;

  void clearInputs() {
    questionController.text = '';
    tagsController.text = '#general';
  }

  @override
  Widget build(BuildContext context) {
    final uid = Provider.of<String>(context);
    this.tagsController.text = '#general';

    List<Widget> screenList = [
      QuestionList(),
      SearchQuestions(),
    ];
    
    return Scaffold(
      appBar: AppBar(
        title: Text('NIEAnswerHub'),
        actions: [
          TextButton(
            child: Icon(Icons.account_box_rounded),
            onPressed: () async {
              await _authInstance.signOut();
            },
          ),
        ],
      ),
      body: screenList[currentIndex],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(context, (MaterialPageRoute(builder: (context) => AskQuestion(dept: 'general'),)),);
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
