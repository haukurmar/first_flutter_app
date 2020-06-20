import "dart:convert";

import 'package:http/http.dart' as http;

import 'customer_models.dart';

String apiPath = "https://5e8df3d022d8cd0016a79dcd.mockapi.io/customers";

Future<Customer> fetchCustomer(String customerId) async {
  final response = await http.get('$apiPath/$customerId');

  if (response.statusCode == 200) {
    return Customer.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load customer');
  }
}
