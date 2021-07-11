import 'package:flutter/material.dart';
import 'package:minor_project/models/project_request.dart';
import 'package:minor_project/screens/project_req/request_tile.dart';
import 'package:minor_project/utils/spinner/loading_spinner.dart';
import 'package:provider/provider.dart';

class DisplayProjectRequests extends StatefulWidget {
  @override
  _DisplayProjectRequestsState createState() => _DisplayProjectRequestsState();
}

class _DisplayProjectRequestsState extends State<DisplayProjectRequests> {
  @override
  Widget build(BuildContext context) {
    List<ProjectRequest> requests = Provider.of<List<ProjectRequest>>(context);
    bool loading = true;

    if (requests != null) {
      setState(() {
        loading = false;
      });
    }

    if (loading) {
      return Loading();
    }

    return ListView.builder(
      itemBuilder: (context, index) => RequestTile(requests[index]),
      itemCount: requests.length,
    );
  }
}
