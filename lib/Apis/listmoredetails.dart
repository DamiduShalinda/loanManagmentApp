import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class LoanData {
  String bikeNumber;
  String branchLocation;
  String firstGuarantor;
  String loanedDate;
  String loanNumber;
  String secondGuarantor;
  String username;

  LoanData({
    required this.bikeNumber,
    required this.branchLocation,
    required this.firstGuarantor,
    required this.loanedDate,
    required this.loanNumber,
    required this.secondGuarantor,
    required this.username,
  });

  factory LoanData.fromJson(Map<String, dynamic> json) {
    return LoanData(
      bikeNumber: json['bike_number'],
      branchLocation: json['branch_location'],
      firstGuarantor: json['first_guarantor'],
      loanedDate: json['loaned_date'],
      loanNumber: json['loan_number'],
      secondGuarantor: json['second_guarantor'],
      username: json['username'],
    );
  }
}

Future<LoanData> fetchOneLoanData(int id) async {
  var errorMessage = "".obs;
  try {
    var url = Uri.parse("http://10.0.2.2:8000/loans/getloans/$id");
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      return LoanData.fromJson(body);
    } else {
      errorMessage("Something went wrong");
      throw Exception("Something went wrong"); // Throw an exception to indicate an error
    }
  } catch (e) {
    errorMessage(e.toString());
    throw Exception(e.toString()); // Throw an exception to indicate an error
  }
}

