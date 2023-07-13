import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../api_endpoints.dart';

class LoanPayments {
  final int id;
  final String loannumber;
  final String paymentdate;
  final double paymentamount;
  final double interest;
  final double principle;
  final double balance;

  LoanPayments({
    required this.id,
    required this.loannumber,
    required this.paymentdate,
    required this.paymentamount,
    required this.interest,
    required this.principle,
    required this.balance,
  });

  factory LoanPayments.fromJson(Map<String, dynamic> json) {
    return LoanPayments(
      id: json['id'],
      loannumber: json['loan_number'],
      paymentdate: json['payment_date'],
      paymentamount: json['payment_amount'],
      interest: json['interest'],
      principle: json['principle'],
      balance: json['balance'],
    );
  }

}

List<LoanPayments> fetchListLoanPayments( http.Response response) {
  List<dynamic> laonList = jsonDecode(response.body);
  List<LoanPayments> loans = [];
  for (var element in laonList) {
    loans.add(LoanPayments.fromJson(element));
  }
  return loans;
}


 Future<List<LoanPayments>> fetchListPaymentValues( int id) async {

    var errorMessage = "".obs;

    try {
      var url = Uri.parse(ApiEndPoints.baseUrl + ApiEndPoints.authEndPoints.getLoanPaymentValues(id));
      http.Response response = await http.get(url);
      if (response.statusCode == 200) {
        List<LoanPayments> loanList = fetchListLoanPayments(response);
        return loanList ;
      } else {
        errorMessage("Something went wrong");
        return [];
      }
    } catch (e) {
      errorMessage(e.toString());
      return [];
    } 
  }

