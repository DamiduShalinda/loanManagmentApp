import 'dart:convert';
import 'package:http/http.dart' as http;

class MoreLoanDetails {
  final int loanId;
  final String username;
  final String firstGuarantor;
  final String secondGuarantor;
  final String loanedDate;
  final String branchLocation;
  final double loanedAmount;
  final String loanNumber;
  final String bikeNumber;
  final int loanPeriod;

  MoreLoanDetails({
    required this.loanId,
    required this.username,
    required this.firstGuarantor,
    required this.secondGuarantor,
    required this.loanedDate,
    required this.branchLocation,
    required this.loanedAmount,
    required this.bikeNumber,
    required this.loanNumber,
    required this.loanPeriod,
  });

  factory MoreLoanDetails.fromJson(Map<String, dynamic> json) {
    return MoreLoanDetails(
      loanId: json['loan_id'],
      username: json['username'],
      firstGuarantor: json['first_guarantor'],
      secondGuarantor: json['second_guarantor'],
      loanedDate: json['loaned_date'],
      branchLocation: json['branch_location'],
      loanedAmount: double.parse(json['loaned_amount']),
      loanNumber: json['loan_number'],
      bikeNumber: json['bike_number'],
      loanPeriod: json['loan_period'],
    );
  }

}

List<MoreLoanDetails> fetchList( http.Response response) {
  List<dynamic> laonList = jsonDecode(response.body);
  List<MoreLoanDetails> loans = [];
  for (var element in laonList) {
    loans.add(MoreLoanDetails.fromJson(element));
  }
  return loans;
}

MoreLoanDetails fetchDetails(http.Response response) {
  Map<String, dynamic> data = jsonDecode(response.body);
  MoreLoanDetails loan = MoreLoanDetails.fromJson(data);
  return loan;
}