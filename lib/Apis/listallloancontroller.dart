import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:loan_managment_app/api_endpoints.dart';
import 'package:http/http.dart' as http;

class ListAllLoanController extends GetxController {
  var errorMessage = "".obs;


 Future <void> fetchListAllLoan() async {
    try {
      var url = Uri.parse(ApiEndPoints.baseUrl + ApiEndPoints.authEndPoints.listallloans);
      http.Response response = await http.get(url);
      if (response.statusCode == 200) {
        if (kDebugMode) {
          print(response.body);
        }
      } else {
        errorMessage("Something went wrong");
      }
    } catch (e) {
      errorMessage(e.toString());
    } finally {
    }
  }
}


class Loan {
  final String loanId;
  final String username;
  final String loanedDate;
  final String branchLocation;
  final double loanedAmount;

  Loan({
    required this.loanId,
    required this.username,
    required this.loanedDate,
    required this.branchLocation,
    required this.loanedAmount,
  });

  factory Loan.fromJson(Map<String, dynamic> json) {
    return Loan(
      loanId: json['loan_id'],
      username: json['username'],
      loanedDate: json['loaned_date'],
      branchLocation: json['branch_location'],
      loanedAmount: double.parse(json['loaned_amount']),
    );
  }
}