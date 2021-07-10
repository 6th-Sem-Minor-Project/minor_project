import 'package:flutter/material.dart';

class AddProjectRequest extends StatefulWidget {
  @override
  _AddProjectRequestState createState() => _AddProjectRequestState();
}

class _AddProjectRequestState extends State<AddProjectRequest> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Form(
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: TextFormField(
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
                      hintText: "Enter Project Title"),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: TextFormField(
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
                      labelText: "Skills Required",
                      labelStyle: TextStyle(
                        color: Colors.blue[800],
                      ),
                      hintText: "Enter required skills for the project"),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: TextFormField(
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
                      labelText: "Number of Team Member",
                      labelStyle: TextStyle(
                        color: Colors.blue[800],
                      ),
                      hintText: "Enter Number of Team Member"),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: TextFormField(
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
                          "Enter space separated department tags relevant to project. ",
                      hintText: "Enter Department Tags (Ex: #general)"),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: TextFormField(
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
                          "Enter a brief description about Project... (optional)"),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: RaisedButton(
                  onPressed: () {},
                  color: Colors.blue[800],
                  textColor: Colors.blueGrey[100],
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
    );
  }
}
