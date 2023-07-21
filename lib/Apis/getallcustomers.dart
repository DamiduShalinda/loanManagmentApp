import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../api_endpoints.dart';

class CustomersNameID {
  String name;
  int id;

  CustomersNameID({required this.name, required this.id});

  factory CustomersNameID.fromJson(Map<String, dynamic> json) {
    return CustomersNameID(
      name: json['name'],
      id: json['id'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['id'] = id;
    return data;
  }

}

Future<List<CustomersNameID>> fetchAllCustomersNames() async {
  var errorMessage = "".obs;
  try {
    var url = Uri.parse(ApiEndPoints.baseUrl + ApiEndPoints.authEndPoints.getallcustomernames);
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      List<CustomersNameID> customersNameID = [];
      for (var item in body) {
        customersNameID.add(CustomersNameID.fromJson(item));
      }
      return customersNameID;
    } else {
      errorMessage("Something went wrong");
      throw Exception("Something went wrong"); // Throw an exception to indicate an error
    }
  } catch (e) {
    errorMessage(e.toString());
    throw Exception(e.toString()); // Throw an exception to indicate an error
  }
}