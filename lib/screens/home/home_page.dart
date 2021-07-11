import 'package:flutter/material.dart';
import 'package:minor_project/screens/dept/select_dept.dart';
import 'package:minor_project/screens/home/ask_question.dart';
import 'package:minor_project/screens/home/question_list.dart';
import 'package:minor_project/screens/profile/user_profile.dart';
import 'package:minor_project/screens/project_req/add_project_request.dart';
import 'package:minor_project/screens/project_req/display_requests.dart';
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

  Widget getFloatingActionButtonforPage(int index) {
    switch (index) {
      case 0:
        return Visibility(
          visible: currentIndex == 0 ? true : false,
          child: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                (MaterialPageRoute(
                  builder: (context) => AskQuestion(dept: 'general'),
                )),
              );
            },
          ),
        );
      case 3:
        return Visibility(
          visible: currentIndex == 3 ? true : false,
          child: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                (MaterialPageRoute(
                  builder: (context) => AddProjectRequest(),
                )),
              );
            },
          ),
        );
      default:
        return SizedBox();
    }
  }

  var currentIndex = 0;

  void clearInputs() {
    questionController.text = '';
    tagsController.text = '#general';
  }

  @override
  Widget build(BuildContext context) {
    final uid = Provider.of<String>(context);
    this.tagsController.text = '#general';

    List<String> titleList = [
      'Nie AnswerHub',
      'Search Page',
      'Select Department',
      'Project Collaboration Request',
    ];

    List<dynamic> tagsToFilter = ['general'];

    List<Widget> screenList = [
      QuestionList(tagsToFilter: tagsToFilter),
      SearchQuestions(),
      SelectDepartment(),
      DisplayProjectRequests(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(titleList[currentIndex]),
        actions: [
          MaterialButton(
            child: Icon(
              Icons.account_circle_sharp,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UserProfile(),
                ),
              );
            },
          ),
        ],
      ),
      body: screenList[currentIndex],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: getFloatingActionButtonforPage(currentIndex),
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
            icon: Icon(Icons.account_balance_sharp),
            label: 'Dept',
            // title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.my_library_add_sharp),
            label: 'Colab',
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
