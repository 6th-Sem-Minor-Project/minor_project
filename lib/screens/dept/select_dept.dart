import 'package:flutter/material.dart';

class SelectDepartment extends StatefulWidget {
  @override
  _SelectDepartmentState createState() => _SelectDepartmentState();
}

class _SelectDepartmentState extends State<SelectDepartment> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            //SizedBox(width: 1000),
            //Text("Choose the Department : "),
            Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: FlatButton(
                  padding: EdgeInsets.all(20),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  color: Colors.blueGrey[100],
                  onPressed: () {},
                  child: Row(
                    children: [
                      Icon(Icons.person),
                      SizedBox(width: 20),
                      Expanded(
                        child: Text(
                          "Civil Engineering",
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ),
                      Icon((Icons.arrow_forward_ios))
                    ],
                  ),
                )),
            Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: FlatButton(
                  padding: EdgeInsets.all(20),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  color: Colors.blueGrey[100],
                  onPressed: () {},
                  child: Row(
                    children: [
                      Icon(Icons.person),
                      SizedBox(width: 20),
                      Expanded(
                        child: Text(
                          "Mechanical Engineering",
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ),
                      Icon((Icons.arrow_forward_ios))
                    ],
                  ),
                )),
            Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: FlatButton(
                  padding: EdgeInsets.all(20),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  color: Colors.blueGrey[100],
                  onPressed: () {},
                  child: Row(
                    children: [
                      Icon(Icons.person),
                      SizedBox(width: 20),
                      Expanded(
                        child: Text(
                          "Electrical & Electronics Engineering",
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ),
                      Icon((Icons.arrow_forward_ios))
                    ],
                  ),
                )),
            Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: FlatButton(
                  padding: EdgeInsets.all(20),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  color: Colors.blueGrey[100],
                  onPressed: () {},
                  child: Row(
                    children: [
                      Icon(Icons.person),
                      SizedBox(width: 20),
                      Expanded(
                        child: Text(
                          "Electronics & Communication Engineering",
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ),
                      Icon((Icons.arrow_forward_ios))
                    ],
                  ),
                )),
            Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: FlatButton(
                  padding: EdgeInsets.all(20),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  color: Colors.blueGrey[100],
                  onPressed: () {},
                  child: Row(
                    children: [
                      Icon(Icons.person),
                      SizedBox(width: 20),
                      Expanded(
                        child: Text(
                          "Industrial & Production Engineering",
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ),
                      Icon((Icons.arrow_forward_ios))
                    ],
                  ),
                )),
            Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: FlatButton(
                  padding: EdgeInsets.all(20),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  color: Colors.blueGrey[100],
                  onPressed: () {},
                  child: Row(
                    children: [
                      Icon(Icons.person),
                      SizedBox(width: 20),
                      Expanded(
                        child: Text(
                          "Computer Science Engineering",
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ),
                      Icon((Icons.arrow_forward_ios))
                    ],
                  ),
                )),
            Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: FlatButton(
                  padding: EdgeInsets.all(20),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  color: Colors.blueGrey[100],
                  onPressed: () {},
                  child: Row(
                    children: [
                      Icon(Icons.person),
                      SizedBox(width: 20),
                      Expanded(
                        child: Text(
                          "Information Science Engineering",
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ),
                      Icon((Icons.arrow_forward_ios))
                    ],
                  ),
                )),
            Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: FlatButton(
                  padding: EdgeInsets.all(20),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  color: Colors.blueGrey[100],
                  onPressed: () {},
                  child: Row(
                    children: [
                      Icon(Icons.person),
                      SizedBox(width: 20),
                      Expanded(
                        child: Text(
                          "Master of Computer Applications",
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ),
                      Icon((Icons.arrow_forward_ios))
                    ],
                  ),
                )),
            Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: FlatButton(
                  padding: EdgeInsets.all(20),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  color: Colors.blueGrey[100],
                  onPressed: () {},
                  child: Row(
                    children: [
                      Icon(Icons.person),
                      SizedBox(width: 20),
                      Expanded(
                        child: Text(
                          "Mathematics",
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ),
                      Icon((Icons.arrow_forward_ios))
                    ],
                  ),
                )),
            Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: FlatButton(
                  padding: EdgeInsets.all(20),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  color: Colors.blueGrey[100],
                  onPressed: () {},
                  child: Row(
                    children: [
                      Icon(Icons.person),
                      SizedBox(width: 20),
                      Expanded(
                        child: Text(
                          "Physics",
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ),
                      Icon((Icons.arrow_forward_ios))
                    ],
                  ),
                )),
            Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: FlatButton(
                  padding: EdgeInsets.all(20),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  color: Colors.blueGrey[100],
                  onPressed: () {},
                  child: Row(
                    children: [
                      Icon(Icons.person),
                      SizedBox(width: 20),
                      Expanded(
                        child: Text(
                          "Chemistry",
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ),
                      Icon((Icons.arrow_forward_ios))
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
