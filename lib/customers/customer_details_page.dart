import 'package:flutter/material.dart';

import 'customer_data.dart';
import 'customer_models.dart';

class CustomerDetailsPage extends StatefulWidget {
  CustomerDetailsPage({Key key, this.title, this.customerId}) : super(key: key);
  final String title;
  final String customerId;
  @override
  _CustomerDetailsPageState createState() => _CustomerDetailsPageState();
}

class _CustomerDetailsPageState extends State<CustomerDetailsPage> {
  Future<Customer> futureCustomer;

  @override
  void initState() {
    super.initState();
    futureCustomer = CustomerApi.getSingleCustomer(widget.customerId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
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
                    var customer = snapshot.data;
                    return Text(customer.firstName + " " + customer.lastName);
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
