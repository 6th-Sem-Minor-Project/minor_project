import 'package:flutter/material.dart';

Future<bool> showMyDialog(context, String title, String msg,
    {List<Function> cbs = null, Map<int, dynamic> args}) async {
  return showDialog<bool>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: SingleChildScrollView(child: Text(msg)),
        actions: [
          TextButton(
            child: Text('OK'),
            onPressed: () async {
              if (cbs != null) {
                for (int i = 0; i < cbs.length; i++) {
                  if (args.containsKey(i)) {
                    cbs[i](args[i]);
                  } else {
                    cbs[i]();
                  }
                }
              }
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
