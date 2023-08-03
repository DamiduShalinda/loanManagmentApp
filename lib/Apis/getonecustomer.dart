import 'dart:convert';

import 'package:get/get.dart';
import 'package:loan_managment_app/api_endpoints.dart';
import 'package:http/http.dart' as http;

class OneCustomerDetails {
  int id;
  String name;
  String surname;
  String address;
  String telephone1;
  String telephone2;
  String dateofbirth;
  String nicnumber;
  String? profileimage;
  int? user;

  OneCustomerDetails(
      {required this.id,
      required this.name,
      required this.surname,
      required this.address,
      required this.telephone1,
      required this.telephone2,
      required this.dateofbirth,
      required this.nicnumber,
      this.profileimage,
      this.user});

  factory OneCustomerDetails.fromJson(Map<String, dynamic> json) {
    return OneCustomerDetails(
      id : json['id'],
      name : json['name'],
      surname : json['surname'],
      address : json['address'],
      telephone1 : json['telephone1'],
      telephone2 : json['telephone2'],
      dateofbirth : json['dateofbirth'],
      nicnumber : json['nicnumber'],
      profileimage : json['profileimage'],
      user : json['user'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['surname'] = surname;
    data['address'] = address;
    data['telephone1'] = telephone1;
    data['telephone2'] = telephone2;
    data['dateofbirth'] = dateofbirth;
    data['nicnumber'] = nicnumber;
    data['profileimage'] = profileimage;
    data['user'] = user;
    return data;
  }
}

Future<OneCustomerDetails> fetchOneCustomer (int id) async {
  var errorMessage = "".obs;
  try {
    var url = Uri.parse(ApiEndPoints.baseUrl + ApiEndPoints.authEndPoints.getOneCustomer(id));
     http.Response response = await http.get(url);
     print(response.body);
    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      OneCustomerDetails oneCustomer = OneCustomerDetails.fromJson(body);
      return oneCustomer;
    } else {
      errorMessage("Something went wrong");
      throw Exception("Something went wrong"); // Throw an exception to indicate an error
    }
  } catch (e) {
    errorMessage.value = e.toString();
    throw Exception(e.toString());
  }
}