import 'dart:convert';
import 'package:http/http.dart' as http;

class LoanPayments {
  final String loanId;
  final String username;
  final String paymentDate;
  final double paymentAmount;
  final double principal;
  final double interest;
  final double balance;

  LoanPayments({
    required this.loanId,
    required this.username,
    required this.paymentDate,
    required this.paymentAmount,
    required this.principal,
    required this.interest,
    required this.balance,
  });

  factory LoanPayments.fromJson(Map<String, dynamic> json) {
    return LoanPayments(
      loanId: json['loan_id'],
      username: json['username'],
      paymentDate: json['payment_date'],
      paymentAmount: double.parse(json['payment_amount']),
      principal: double.parse(json['principal']),
      interest: double.parse(json['interest']),
      balance: double.parse(json['balance']),
    );
  }

}

List<LoanPayments> fetchList( http.Response response) {
  List<dynamic> laonList = jsonDecode(response.body);
  List<LoanPayments> loans = [];
  for (var element in laonList) {
    loans.add(LoanPayments.fromJson(element));
  }
  return loans;
}