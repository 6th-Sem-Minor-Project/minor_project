import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../services/auth_service.dart';
import '../home/home_page.dart';
import '../../utils/spinner/loading_spinner.dart';
import '../../utils/dialog/show_dialog.dart';

// class LoginPage extends StatefulWidget {
//   Function toggleAuthForms;

//   LoginPage(this.toggleAuthForms);

//   @override
//   _LoginPageState createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   final AuthService _authInstance = AuthService();
//   bool _obscureText = true;

//   final emailController = new TextEditingController();
//   final passwordController = new TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         FocusScopeNode currentFocus = FocusScope.of(context);
//         if (!currentFocus.hasPrimaryFocus) {
//           currentFocus.unfocus();
//         }
//       },
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text('Login'),
//         ),
//         body: Container(
//           padding: EdgeInsets.symmetric(horizontal: 20),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               TextField(
//                 controller: emailController,
//                 autofocus: false,
//                 decoration: InputDecoration(
//                   labelText: 'Email',
//                 ),
//                 keyboardType: TextInputType.emailAddress,
//               ),
//               TextField(
//                 controller: passwordController,
//                 obscureText: _obscureText,
//                 decoration: InputDecoration(
//                   suffixIcon: IconButton(
//                     icon: Icon(Icons.visibility),
//                     onPressed: () {
//                       setState(() {
//                         this._obscureText = !this._obscureText;
//                       });
//                     },
//                   ),
//                   labelText: 'Password',
//                 ),
//                 keyboardType: TextInputType.emailAddress,
//               ),
//               SizedBox(
//                 height: 30,
//               ),
//               ElevatedButton(
//                 style: ButtonStyle(
//                   shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                     RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(18),
//                     ),
//                   ),
//                 ),
//                 onPressed: () async {
//                   String uid = await _authInstance.signInEmail(
//                       this.emailController.text, this.passwordController.text);
//                   if (uid != null) {
//                     print(uid);
//                   }
//                 },
//                 child: Text('Login'),
//               ),
//               TextButton(
//                 onPressed: () {
//                   widget.toggleAuthForms();
//                 },
//                 child: Text('Sign up Here...'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

class LoginPage extends StatefulWidget {
  Function toggleForms;

  LoginPage(this.toggleForms);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final AuthService _auth = AuthService();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool _obscureText = true;

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: loading
          ? Loading()
          : Scaffold(
              appBar: AppBar(
                title: Text('Sign into Brew Crew'),
              ),
              body: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextField(
                      controller: emailController,
                      autofocus: false,
                      decoration: InputDecoration(
                        labelText: 'Email',
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    TextField(
                      controller: passwordController,
                      obscureText: this._obscureText,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: Icon(Icons.visibility),
                          onPressed: () {
                            setState(() {
                              this._obscureText = !this._obscureText;
                            });
                          },
                        ),
                        labelText: 'Password',
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18),
                            ),
                          ),
                        ),
                        onPressed: () async {
                          setState(() {
                            loading = true;
                          });
                          dynamic result = await _auth.signInEmail(
                              this.emailController.text,
                              this.passwordController.text);
                          setState(() {
                            loading = false;
                          });
                          if (!result.isAuthSuccessful) {
                            print('inside if');
                            if (result.errMsg == 'user-not-found') {
                              String title = 'Email not found';
                              String msg =
                                  'The entered email is not present. Please check the email.';
                              showMyDialog(context, title, msg);
                            }
                            if (result.errMsg == 'wrong-password') {
                              String title = 'Wrong password';
                              String msg =
                                  'The entered password does not match with the email. Please check the email and password';
                              showMyDialog(context, title, msg);
                            }
                          }
                        },
                        child: Text('Login'),
                      ),
                    ),
                    TextButton(
                      child: Text('Register Here...'),
                      onPressed: () {
                        widget.toggleForms();
                      },
                    ),
                  ],
                ),
              )),
    );
  }
}
