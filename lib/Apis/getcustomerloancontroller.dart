import 'dart:convert';
import 'dart:core';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../api_endpoints.dart';

class CustomerLoanData {
  final int loanID;
  final int username;
  final double loanedamount;
  final String loannumber;
  
  CustomerLoanData({
    required this.loanID,
    required this.username,
    required this.loanedamount,
    required this.loannumber,
  });

  factory CustomerLoanData.fromJson(Map<String, dynamic> json) {
    return CustomerLoanData(
      username: json['username'],
      loanID: json['loan_id'],
      loanedamount: json['loaned_amount'],
      loannumber: json['loan_number'],
    );
  }
}

Future<CustomerLoanData> fetchCustomerLoanData(int id) async {
  var errorMessage = "".obs;
  try {
    var url = Uri.parse(ApiEndPoints.baseUrl + ApiEndPoints.authEndPoints.getCustomerLoanDetails(1));
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      return CustomerLoanData.fromJson(body);
    } else {
      errorMessage("Something went wrong");
      throw Exception("Something went wrong"); // Throw an exception to indicate an error
    }
  } catch (e) {
    errorMessage(e.toString());
    throw Exception(e.toString()); // Throw an exception to indicate an error
  }
}
