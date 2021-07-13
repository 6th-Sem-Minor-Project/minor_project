import 'package:flutter/material.dart';
import 'package:minor_project/screens/search/filtered_questions.dart';

class SearchQuestions extends StatefulWidget {
  @override
  _SearchQuestionsState createState() => _SearchQuestionsState();
}

class _SearchQuestionsState extends State<SearchQuestions> {
  TextEditingController tagsController = TextEditingController();

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

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: SingleChildScrollView(
        child: Column(
          children: [
            TextFormField(
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
                  labelText: "Search",
                  labelStyle: TextStyle(
                    color: Colors.blue[800],
                  ),
                  hintText: 'Enter the tags that you want to search'),
            ),
            ElevatedButton(
              onPressed: () {
                if (tagsController.text != "") {
                  List<dynamic> tagsToFilter =
                      _processInputTags(tagsController.text);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FilteredQuestions(
                        tagsToFilter: tagsToFilter,
                      ),
                    ),
                  );
                }
              },
              child: Text('Search'),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue[800],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
