import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:loan_managment_app/api_endpoints.dart';

class LoanData {
  int id;
  String loanNumber;
  String loanedDate;
  String branchLocation;
  double loanedAmount;
  String bikeNumber;
  int loanPeriod;
  int username;
  int firstGuarantor;
  int secondGuarantor;

  LoanData({
    required this.id,
    required this.loanNumber,
    required this.loanedDate,
    required this.branchLocation,
    required this.loanedAmount,
    required this.bikeNumber,
    required this.loanPeriod,
    required this.username,
    required this.firstGuarantor,
    required this.secondGuarantor,
  });

  factory LoanData.fromJson(Map<String, dynamic> json) {
    return LoanData(
      id: json['loan_id'],
      loanNumber: json['loan_number'],
      loanedDate: json['loaned_date'],
      branchLocation: json['branch_location'],
      loanedAmount: json['loaned_amount'],
      bikeNumber: json['bike_number'],
      loanPeriod: json['loan_period'],
      username: json['username'],
      firstGuarantor: json['first_guarantor'],
      secondGuarantor: json['second_guarantor'],
    );
  }
}

Future<LoanData> fetchOneLoanData(int id) async {
  var errorMessage = "".obs;
  try {
    var url = Uri.parse(ApiEndPoints.baseUrl + ApiEndPoints.authEndPoints.getMoreLoanDetails(id));
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      LoanData loanData = LoanData.fromJson(body);
      return loanData;
    } else {
      errorMessage("Something went wrong");
      throw Exception("Something went wrong"); // Throw an exception to indicate an error
    }
  } catch (e) {
    errorMessage(e.toString());
    throw Exception(e.toString()); // Throw an exception to indicate an error
  }
}

