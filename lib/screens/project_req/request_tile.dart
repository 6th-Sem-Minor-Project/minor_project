import 'package:flutter/material.dart';
import 'package:minor_project/models/project_request.dart';
import 'package:minor_project/screens/project_req/request_details.dart';

class RequestTile extends StatelessWidget {
  final ProjectRequest request;

  RequestTile(this.request);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => RequestDetails(request)));
      },
      child: Container(
        child: Card(
          child: ListTile(
            title: Text(
              request.title,
              style: TextStyle(
                fontWeight: FontWeight.w700,
              ),
            ),
            subtitle: Text(request.subTitle),
            trailing: Text(
              request.isClosed ? 'Closed' : 'Open',
              style: TextStyle(
                color: request.isClosed
                    ? Colors.redAccent[700]
                    : Colors.greenAccent[700],
                fontSize: 16,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
