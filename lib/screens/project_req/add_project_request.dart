import 'package:flutter/material.dart';
import 'package:minor_project/models/project_request.dart';
import 'package:minor_project/services/database.dart';
import 'package:provider/provider.dart';

class AddProjectRequest extends StatefulWidget {
  @override
  _AddProjectRequestState createState() => _AddProjectRequestState();
}

class _AddProjectRequestState extends State<AddProjectRequest> {
  final _formKey = GlobalKey<FormState>();

  List<dynamic> getSkillList(String skills) {
    List<dynamic> skillList = skills.split(',');
    skillList.forEach((skill) {
      skill = skill.toString().trim();
    });
    return skillList;
  }

  List<dynamic> _processInputTags(String tags) {
    tags = tags.trim();
    List<dynamic> tagsList = tags.split('#');
    tagsList = tagsList.sublist(1);
    tagsList.forEach((element) {
      element = element.toString().trim();
    });
    // print(tagsList);
    return tagsList;
  }

  TextEditingController titleController = TextEditingController();
  TextEditingController subtitleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController aocController = TextEditingController();
  TextEditingController teamSizeController = TextEditingController();
  TextEditingController tagsController = TextEditingController();

  DatabaseService _db = DatabaseService();

  @override
  Widget build(BuildContext context) {
    String uid = Provider.of<String>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Request Collaboration'),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: TextFormField(
                    controller: titleController,
                    validator: (value) =>
                        value == "" ? 'This field cannot be empty' : null,
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
                        labelText: "Project Title",
                        labelStyle: TextStyle(
                          color: Colors.blue[800],
                        ),
                        hintText: "Project Title (Tentative)..."),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: TextFormField(
                    controller: subtitleController,
                    validator: (value) =>
                        value == "" ? 'This field cannot be empty' : null,
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
                        labelText: "Subtitle",
                        labelStyle: TextStyle(
                          //textBaseline: TextBaseline.ideographic,
                          color: Colors.blue[800],
                        ),
                        hintText: "Project aim in a single sentenct..."),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: TextFormField(
                    controller: descriptionController,
                    maxLines: null,
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
                        labelText: "Project Description",
                        labelStyle: TextStyle(
                          //textBaseline: TextBaseline.ideographic,
                          color: Colors.blue[800],
                        ),
                        hintText:
                            "A brief description about the project... (optional)"),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: TextFormField(
                    controller: aocController,
                    validator: (value) =>
                        value == "" ? 'This field cannot be empty' : null,
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
                        labelText: "Area of Collaboration",
                        labelStyle: TextStyle(
                          color: Colors.blue[800],
                        ),
                        hintText:
                            "All the areas the team will be collaborating on..."),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: TextFormField(
                    controller: teamSizeController,
                    validator: (value) =>
                        value == "" ? 'This field cannot be empty' : null,
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
                        labelText: "Team Size",
                        labelStyle: TextStyle(
                          color: Colors.blue[800],
                        ),
                        hintText: "Expected Team Size..."),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: TextFormField(
                    controller: tagsController,
                    validator: (value) =>
                        value == "" ? 'This field cannot be empty' : null,
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
                        labelText: "Tags",
                        labelStyle: TextStyle(
                          color: Colors.blue[800],
                        ),
                        helperText:
                            "Enter # separated department tags relevant to project. ",
                        hintText:
                            "Enter Department Tags (Ex: #cse#me#ise, etc.,)"),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: RaisedButton(
                    onPressed: () async {
                      if (_formKey.currentState.validate()) {
                        ProjectRequest newRequest = ProjectRequest(
                          title: titleController.text,
                          subTitle: subtitleController.text,
                          description: descriptionController.text,
                          skills: getSkillList(aocController.text),
                          teamHeadCount: teamSizeController.text,
                          tags: _processInputTags(tagsController.text),
                          isClosed: false,
                          uid: uid,
                        );
                        await _db.addRequest(newRequest);
                        Navigator.pop(context);
                      }
                    },
                    color: Colors.blue[800],
                    textColor: Colors.blueGrey[100],
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Text("Send Request"),
                  ),
                ),
                Container(
                  height: 80,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
