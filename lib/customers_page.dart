import 'package:flutter/material.dart';

import './customers/customer_models.dart';
import 'customers/customer_data.dart';
import 'customers/customer_details_page.dart';

class CustomersPage extends StatefulWidget {
  CustomersPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _CustomersPageState createState() => _CustomersPageState();
}

class _CustomersPageState extends State<CustomersPage> {
  Future<List<Customer>> futureCustomers;

  @override
  void initState() {
    super.initState();
    futureCustomers = CustomerApi.getCustomers();
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
        child: FutureBuilder<List<Customer>>(
          future: futureCustomers,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    var customer = snapshot.data[index];
                    return Container(
                      color: Colors.orange,
                      margin: EdgeInsets.only(bottom: 8),
                      child: ListTile(
                        title:
                            Text(customer.firstName + " " + customer.lastName),
                        leading: Icon(Icons.account_circle),
                        trailing: Icon(Icons.chevron_right),
                        onTap: () {
                          print("click");
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CustomerDetailsPage(
                                        title: "Customer details",
                                        customerId: customer.id,
                                      )));
                        },
                      ),
                    );
                  });
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }

            // By default, show a loading spinner.
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
