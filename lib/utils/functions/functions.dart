import 'package:minor_project/models/user.dart';

class Functions {
  static getUserDetails(List<UserModel> users, String uid) {
    UserModel user = users.where((user) => user.uid == uid).toList()[0];
    return user;
  }
}
