import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

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
              child: Text('How many roads must a man walk down?',
                  style: Theme.of(context).textTheme.headline6),
            ),
            Container(
              height: 200.0,
              //margin: EdgeInsets.all(16.0),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(16.0)),
              child: Text(
                '$_counter',
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
