import 'package:flutter/material.dart';

class SchoolPage extends StatefulWidget {
  SchoolPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SchoolPageState createState() => _SchoolPageState();
}

class _SchoolPageState extends State<SchoolPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: TextStyle(
              fontFamily: Theme.of(context).textTheme.headline6.fontFamily,
              fontSize: Theme.of(context).textTheme.headline6.fontSize,
              fontWeight: Theme.of(context).textTheme.headline6.fontWeight,
              letterSpacing:
                  Theme.of(context).textTheme.headline6.letterSpacing,
              color: Colors.white),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: 16.0),
              child: Text('This is the school page',
                  style: Theme.of(context).textTheme.headline6),
            ),
          ],
        ),
      ),
    );
  }
}
