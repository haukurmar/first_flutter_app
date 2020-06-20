class Customer {
  String id;
  String firstName;
  String lastName;

  //Customer({this.id, this.firstName, this.lastName});
  Customer(String id, String firstName, String lastName) {
    this.id = id;
    this.firstName = firstName;
    this.lastName = lastName;
  }

  Customer.fromJson(Map json)
      : id = json['id'],
        firstName = json['firstName'],
        lastName = json['lastName'];

//  factory Customer.fromJson(Map<String, dynamic> json) {
//    return Customer(
//      id: json['id'],
//      firstName: json['firstName'],
//      lastName: json['lastName'],
//    );

}
