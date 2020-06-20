import "dart:convert";

import 'package:http/http.dart' as http;

import 'customer_models.dart';

String apiPath = "https://5e8df3d022d8cd0016a79dcd.mockapi.io/customers";

// Inspiration: https://medium.com/@paul.allies/flutter-http-get-json-and-list-4e8b014ee541
class CustomerApi {
  static Future<List<Customer>> getCustomers() async {
    final response = await http.get('$apiPath');
    var customers = new List<Customer>();

    if (response.statusCode == 200) {
      Iterable list = json.decode(response.body);
      customers = list.map((model) => Customer.fromJson(model)).toList();

      return customers;
    } else {
      throw Exception('Failed to load customer');
    }
  }

  static Future<Customer> getSingleCustomer(String customerId) async {
    final response = await http.get('$apiPath/$customerId');

    if (response.statusCode == 200) {
      return Customer.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load customer');
    }
  }
}
