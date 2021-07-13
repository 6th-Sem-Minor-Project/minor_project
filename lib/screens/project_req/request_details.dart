import 'package:flutter/material.dart';
import 'package:minor_project/models/project_request.dart';
import 'package:minor_project/models/user.dart';
import 'package:minor_project/screens/project_req/add_project_request.dart';
import 'package:minor_project/screens/project_req/response_page.dart';
import 'package:minor_project/services/database.dart';
import 'package:minor_project/utils/dialog/show_dialog.dart';
import 'package:minor_project/utils/functions/functions.dart';
import 'package:minor_project/utils/spinner/loading_spinner.dart';
import 'package:provider/provider.dart';

class RequestDetails extends StatefulWidget {
  ProjectRequest request;

  RequestDetails(this.request);

  @override
  _RequestDetailsState createState() => _RequestDetailsState();
}

class _RequestDetailsState extends State<RequestDetails> {
  void resetPage() {
    setState(() {
      widget.request.isClosed = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<UserModel> users = Provider.of<List<UserModel>>(context);
    String uid = Provider.of<String>(context);
    bool loading = true;
    DatabaseService _db = DatabaseService();

    if (users != null && uid != null) {
      setState(() {
        loading = false;
      });
    }

    if (loading) {
      return Loading();
    }

    UserModel requester = Functions.getUserDetails(users, widget.request.uid);

    print(widget.request.tags);

    return Scaffold(
      appBar: AppBar(title: Text('Request Details')),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: Text(
                widget.request.title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 23.0,
                ),
              ),
            ),
            SizedBox(height: 15),
            Container(
              margin: EdgeInsets.fromLTRB(20, 0, 20, 20),
              child: Text(
                widget.request.description,
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
            ),
            Row(children: [
              Expanded(child: Divider()),
            ]),
            Container(
              margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Text(
                'Request Details',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20.0,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 25,
                vertical: 10,
              ),
              child: Card(
                elevation: 5,
                child: Container(
                  height: 200,
                  padding: EdgeInsets.all(25),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text('Request Status: '),
                            Expanded(child: SizedBox()),
                            Text(widget.request.isClosed ? 'Closed' : 'Open'),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Text('Expected Team Size: '),
                            Expanded(child: SizedBox()),
                            Text(widget.request.teamHeadCount),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Text('Request Created By: '),
                            Expanded(child: SizedBox()),
                            Text(uid == widget.request.uid
                                ? 'Me'
                                : requester.name),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Text('Requester contact: '),
                            Expanded(child: SizedBox()),
                            Flexible(
                              child: Container(
                                child: Text(
                                  requester.email,
                                  overflow: TextOverflow.fade,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Text('Requester branch: '),
                            Expanded(child: SizedBox()),
                            Text(requester.branch),
                          ],
                        ),
                        
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: Text(
                'Areas of collaboration: ',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20.0,
                ),
              ),
            ),
            SizedBox(height: 10),
            ConstrainedBox(
              constraints:
                  BoxConstraints(maxHeight: double.infinity, minHeight: 150),
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return ListTile(
                      leading: Icon(Icons.arrow_forward),
                      title: Text(widget.request.skills[index]));
                },
                itemCount: widget.request.skills.length,
              ),
            ),
            SizedBox(height: 10),
            widget.request.isClosed
                ? SizedBox()
                : uid == widget.request.uid
                    ? Row(
                        children: [
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 100),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.red[700],
                                ),
                                onPressed: () async {
                                  ProjectRequest requestToBeClosed =
                                      ProjectRequest(
                                    id: widget.request.id,
                                  );
                                  print(widget.request.id);
                                  showMyDialog(context, "Close the reqeust?",
                                      "Do you want to close the request? You cannot reopen a request once it is closed! Do you want to continue?",
                                      cbs: [_db.toggleCloseRequest, resetPage],
                                      args: {0: requestToBeClosed});
                                  print(widget.request.isClosed);
                                },
                                child: Text('Close Request'),
                              ),
                            ),
                          )
                        ],
                      )
                    : Row(
                        children: [
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 100),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.greenAccent[700],
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          InterestedResponsePage(
                                              request: widget.request),
                                    ),
                                  );
                                },
                                child: Text('I\'m Interested!'),
                              ),
                            ),
                          )
                        ],
                      ),
          ],
        ),
      ),
      floatingActionButton: Visibility(
        visible: uid == widget.request.uid && !widget.request.isClosed,
        child: FloatingActionButton(child: Icon(Icons.edit), onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => AddProjectRequest(request: widget.request))).then((request) {
            if(request != null) {
              setState(() {
                widget.request = request;
              });
            }
          });
        }),
      ),
    );
  }
}
