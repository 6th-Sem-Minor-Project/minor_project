import 'package:flutter/material.dart';
import 'package:minor_project/models/project_request.dart';
import 'package:minor_project/models/user.dart';
import 'package:minor_project/utils/functions/functions.dart';
import 'package:minor_project/utils/spinner/loading_spinner.dart';
import 'package:provider/provider.dart';

class InterestedResponsePage extends StatefulWidget {
  final ProjectRequest request;

  InterestedResponsePage({this.request});

  @override
  _InterestedResponsePageState createState() => _InterestedResponsePageState();
}

class _InterestedResponsePageState extends State<InterestedResponsePage> {
  final Map<String, bool> skills = {};

  void addSkillsToMap(List<dynamic> skillList) {
    skillList.forEach((skill) {
      skills[skill.toString()] = false;
    });
  }

  String generateResponseEmail(
    String additionalResponse, UserModel curUser, UserModel requester) {
    List<String> familiarAreas = [];
    skills.forEach((key, value) {
      if(value == true) {
        familiarAreas.add(key);
      }
    });
    String skillString = familiarAreas.join(', ');
    String response =
        'Hi ${requester.name},\n\tI am ${curUser.name}. I am interested in the colab request, ${widget.request.title}, that you had put up on NIE AnswerHub. I would Like to collaborate with you for this project. The areas that I am familiar with are: $skillString' +
            '\nIf you want to team up with me, please feel free to reach out to me\nP.S: ' +
            additionalResponse +
            '\nBest Regards\n${curUser.name}';
    
    return response;
  }

  TextEditingController addResController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    List<UserModel> users = Provider.of<List<UserModel>>(context);
    String uid = Provider.of<String>(context);
    bool loading = true;

    if (users != null && uid != null) {
      setState(() {
        loading = false;
      });
    }

    if (loading) {
      return Loading();
    }

    UserModel currUser = Functions.getUserDetails(users, uid);
    UserModel requester = Functions.getUserDetails(users, widget.request.uid);

    addSkillsToMap(widget.request.skills);

    print(skills);

    return Scaffold(
      appBar: AppBar(
        title: Text('Respond To Request'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.all(20),
              child: Text(
                'Please select the areas you are familiar with or you would like to work on in the project.',
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ConstrainedBox(
                constraints:
                    BoxConstraints(minHeight: 150, maxHeight: double.infinity),
                child: StatefulBuilder(
                    builder: (BuildContext context, StateSetter setState) {
                  return ListView(
                    shrinkWrap: true,
                    children: skills.keys.map((String key) {
                      return CheckboxListTile(
                        title: Text(
                          key,
                          style: TextStyle(
                            fontSize: 18.0,
                          ),
                        ),
                        value: skills[key],
                        onChanged: (bool value) {
                          setState(() {
                            skills[key] = value;
                          });
                        },
                      );
                    }).toList(),
                  );
                }),
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.all(20),
              child: Text(
                'If you have any other remarks, please mention here',
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                controller: addResController,
                cursorColor: Colors.blue[800],
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blueGrey,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blue[800],
                        width: 2,
                      ),
                    ),
                    labelText: "Additional Remarks",
                    labelStyle: TextStyle(
                      color: Colors.blue[800],
                    ),
                    helperText: "This will be added in P.S.",
                    hintText: "Additional Remarks... (Optional)"),
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: RaisedButton(
                      onPressed: () {
                        print(generateResponseEmail(addResController.text, currUser, requester));
                      },
                      color: Colors.blue[800],
                      textColor: Colors.blueGrey[100],
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: Text("Send Response Email"),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
