import 'dart:convert';
import 'package:http/http.dart' as http;

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

List<Loan> fetchList( http.Response response) {
  List<dynamic> laonList = jsonDecode(response.body);
  List<Loan> loans = [];
  for (var element in laonList) {
    loans.add(Loan.fromJson(element));
  }
  return loans;
}