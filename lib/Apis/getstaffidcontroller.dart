import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:loan_managment_app/api_endpoints.dart';

class StaffName {
  String name;
  String assignedLocation;
  int id;

  StaffName({
    required this.name, 
    required this.assignedLocation, 
    required this.id});

  factory StaffName.fromJson(Map<String, dynamic> json) {
    return StaffName(
      name : json['name'],
      assignedLocation : json['assigned_location'],
      id : json['id'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['assigned_location'] = assignedLocation;
    data['id'] = id;
    return data;
  }
}

Future<StaffName> fetchStaffNameData(int id) async {
  var errorMessage = "".obs;
  try {
    var url = Uri.parse(ApiEndPoints.baseUrl + ApiEndPoints.authEndPoints.getStaffName(id));
    http.Response response = await http.get(url);
    print(response.body);
    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      StaffName staffName = StaffName.fromJson(body);
      return staffName;
    } else {
      errorMessage("Something went wrong");
      throw Exception("Something went wrong"); // Throw an exception to indicate an error
    }
  } catch (e) {
    errorMessage(e.toString());
    throw Exception(e.toString()); // Throw an exception to indicate an error
  }
}