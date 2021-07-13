import 'package:minor_project/models/user.dart';
import 'package:url_launcher/url_launcher.dart';

class Functions {
  static getUserDetails(List<UserModel> users, String uid) {
    UserModel user = users.where((user) => user.uid == uid).toList()[0];
    return user;
  }

  static sendEmail(String recipient, String subject, String body) async {
    String url = 'mailto:$recipient?subject=$subject&body=$body';
    if (await canLaunch(url)) {
      await launch(url);
    }
  }
}
