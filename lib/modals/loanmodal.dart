import 'dart:convert';
import 'package:http/http.dart' as http;

import '../api_endpoints.dart';

class UserNameData {
  final String username;
  final int id;

  UserNameData({
    required this.username,
    required this.id,
  });

  factory UserNameData.fromJson(Map<String, dynamic> json) {
    return UserNameData(
      username: json['name'],
      id: json['id'],
    );
  }
}

class Loan {
  final String loanId;
  final UserNameData username;
  final String loanedDate;
  final String branchLocation;
  final double loanedAmount;
  final String loanNumber;

  Loan({
    required this.loanId,
    required this.username,
    required this.loanedDate,
    required this.branchLocation,
    required this.loanedAmount,
    required this.loanNumber,
  });


  factory Loan.fromJson(Map<String, dynamic> json) {
    return Loan(
      loanId: json['loan_id'],
      username: UserNameData.fromJson(json['username']),
      loanedDate: json['loaned_date'],
      branchLocation: json['branch_location'],
      loanedAmount: double.parse(json['loaned_amount']),
      loanNumber: json['loan_number'],
    );
  }

}

Future <List<Loan>> fetchList()  async {

  var url = Uri.parse(ApiEndPoints.baseUrl + ApiEndPoints.authEndPoints.listallloans);
  http.Response response = await http.get(url);
  if (response.statusCode == 200) {
    
  List<dynamic> loanList = jsonDecode(response.body);
  List<Loan> loans = [];

  for (var element in loanList) {
    Map<String, dynamic> json = Map<String, dynamic>.from(element);

    UserNameData usernameData = UserNameData.fromJson(json['username']);
    Loan loan = Loan(
      loanId: json['loan_id'],
      username: usernameData,
      loanedDate: json['loaned_date'],
      branchLocation: json['branch_location'],
      loanedAmount: double.parse(json['loaned_amount']),
      loanNumber: json['loan_number'],
    );

    loans.add(loan);
  }

  return loans;
  } else {
    return [];
  }
}
