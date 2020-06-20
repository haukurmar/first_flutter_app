import 'package:flutter/material.dart';

import './customers/customer_models.dart';
import 'customers/customer_data.dart';

class CustomersPage extends StatefulWidget {
  CustomersPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _CustomersPageState createState() => _CustomersPageState();
}

class _CustomersPageState extends State<CustomersPage> {
  Future<Customer> futureCustomer;

  @override
  void initState() {
    super.initState();
    futureCustomer = fetchCustomer("12");
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
              child: Text('This is the customers page',
                  style: Theme.of(context).textTheme.headline6),
            ),
            Center(
              child: FutureBuilder<Customer>(
                future: futureCustomer,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Text(snapshot.data.firstName);
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }

                  // By default, show a loading spinner.
                  return CircularProgressIndicator();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
