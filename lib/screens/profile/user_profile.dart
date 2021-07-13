import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:minor_project/models/user.dart';
import 'package:minor_project/screens/wrapper.dart';
import 'package:minor_project/services/auth_service.dart';
import 'package:minor_project/services/database.dart';
import 'package:minor_project/utils/dialog/show_dialog.dart';
import 'package:minor_project/utils/functions/functions.dart';
import 'package:minor_project/utils/spinner/loading_spinner.dart';
import 'package:provider/provider.dart';

class UserProfile extends StatefulWidget {
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    List<UserModel> userList = Provider.of<List<UserModel>>(context);
    FirebaseAuth instance = FirebaseAuth.instance;
    User currUser;
    bool loading = true;
    String uid = Provider.of<String>(context);
    DatabaseService _db = DatabaseService();
    AuthService _auth = AuthService();

    if (userList != null && uid != null) {
      setState(() {
        loading = false;
      });
    }

    if (loading) {
      return Loading();
    }

    UserModel user = Functions.getUserDetails(userList, uid);

    final _formKey = GlobalKey<FormState>();
    TextEditingController usernameController = TextEditingController();
    TextEditingController usnController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController semController = TextEditingController();
    TextEditingController deptController = TextEditingController();

    if (user != null) {
      usernameController.text = user.name;
      usnController.text = user.usn;
      print(user.sem);
      semController.text = user.sem;
      deptController.text = user.branch;
      emailController.text = user.email;
    }

    return GestureDetector(
      onTap: () {
        // FocusScopeNode currentFocus = FocusScope.of(context);
        // if (!currentFocus.hasPrimaryFocus) {
        //   currentFocus.unfocus();
        // }
      },
      child: Scaffold(
          appBar: AppBar(
            title: Text('User Profile'),
            centerTitle: true,
          ),
          body: Container(
            color: Colors.blueGrey[100],
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Center(
                    child: SizedBox(
                      height: 140,
                      width: 115,
                      child: Stack(
                        fit: StackFit.expand,
                        clipBehavior: Clip.none,
                        children: [
                          CircleAvatar(
                            child: Icon(Icons.account_circle, size: 100),
                          ),
                          Positioned(
                            right: -8,
                            bottom: 0,
                            child: SizedBox(
                              height: 46,
                              width: 46,
                              child: FlatButton(
                                padding: EdgeInsets.zero,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50),
                                    side: BorderSide(color: Colors.white)),
                                color: Colors.grey,
                                onPressed: () {},
                                child: Icon(Icons.camera_alt_sharp),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 10,
                          ),
                          // Username
                          child: TextFormField(
                            controller: usernameController,
                            validator: (value) => value == ""
                                ? 'This Field cannot be empty'
                                : null,
                            cursorColor: Colors.white,
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
                              prefixIcon: Icon(
                                Icons.person,
                                color: Colors.blue[800],
                              ),
                              labelText: "Username",
                              labelStyle: TextStyle(
                                color: Colors.blue[800],
                              ),
                              hintText: "Enter Username",
                            ),
                          ),
                        ),
                        // USN
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 10,
                          ),
                          child: TextFormField(
                            controller: usnController,
                            validator: (value) => value == ""
                                ? 'This field cannot be empty'
                                : null,
                            cursorColor: Colors.white,
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
                              prefixIcon: Icon(
                                Icons.article_outlined,
                                color: Colors.blue[800],
                              ),
                              labelText: "USN",
                              labelStyle: TextStyle(
                                color: Colors.blue[800],
                              ),
                              hintText: "USN",
                            ),
                          ),
                        ),
                        // Email
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 10,
                          ),
                          child: TextFormField(
                            controller: emailController,
                            cursorColor: Colors.white,
                            decoration: InputDecoration(
                              enabled: false,
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
                              prefixIcon: Icon(
                                Icons.mail_sharp,
                              ),
                              labelText: "Email ID",
                              hintText: "Email Id",
                            ),
                            enabled: false,
                          ),
                        ),
                        // Sem
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 10,
                          ),
                          child: TextFormField(
                            controller: semController,
                            validator: (value) => value == ""
                                ? 'This field cannot be empty'
                                : null,
                            cursorColor: Colors.white,
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
                              prefixIcon: Icon(
                                Icons.perm_contact_calendar_rounded,
                                color: Colors.blue[800],
                              ),
                              labelText: "Semester",
                              labelStyle: TextStyle(
                                color: Colors.blue[800],
                              ),
                              hintText: "Semester",
                            ),
                          ),
                        ),
                        // Department
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 10,
                          ),
                          child: TextFormField(
                            controller: deptController,
                            validator: (value) => value == ""
                                ? 'This field cannot be empty'
                                : null,
                            cursorColor: Colors.white,
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
                              prefixIcon: Icon(
                                Icons.account_balance_sharp,
                                color: Colors.blue[800],
                              ),
                              labelText: "Department",
                              labelStyle: TextStyle(
                                color: Colors.blue[800],
                              ),
                              hintText: "Department",
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: RaisedButton(
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          UserModel updatedUser = UserModel(
                              name: usernameController.text,
                              usn: usnController.text,
                              sem: semController.text,
                              branch: deptController.text,
                              uid: user.uid);
                          await _db.updateUserProfileData(updatedUser);
                          showMyDialog(context, "Successfuly Updated",
                              "Your profile has been successfully updated. If the changes are not yet visible, please refresh the screen.");
                        }
                      },
                      color: Colors.blue[800],
                      textColor: Colors.blueGrey[100],
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: Text("Update"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Row(
                      children: [
                        Expanded(
                          child: RaisedButton(
                            color: Colors.blue[800],
                            onPressed: () async {
                              await instance.sendPasswordResetEmail(
                                  email: user.email);
                              showMyDialog(context, "Password reset email sent",
                                  "An email has been sent to your registered email id with the steps to follow to reset your password.",
                                  cbs: [_auth.signOut]);
                            },
                            child: Text("Change Password"),
                            textColor: Colors.blueGrey[100],
                          ),
                        ),
                        SizedBox(width: 20),
                        Expanded(
                          child: RaisedButton(
                            onPressed: () async {
                              String result = await _auth.signOut();

                              Navigator.pop(context, 'logout');
                            },
                            color: Colors.blue[800],
                            textColor: Colors.blueGrey[100],
                            child: Text("Logout"),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 80,
                    alignment: Alignment.bottomCenter,
                    child: TextButton.icon(
                        onPressed: () {
                          Functions.sendEmail(
                              'nie.answerhub@gmail.com', '', '');
                        },
                        style: TextButton.styleFrom(
                          primary: Colors.blue[800],
                        ),
                        icon: Icon(Icons.help),
                        label: Text("Help Center")),
                    color: Colors.blueGrey[300],
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
