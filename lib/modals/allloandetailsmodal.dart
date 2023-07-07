import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class MoreLoanDetails {
  int? loanId;
  String? username;
  String? firstGuarantor;
  String? secondGuarantor;
  String? loanNumber;
  String? loanedDate;
  String? branchLocation;
  int? loanedAmount;
  String? bikeNumber;
  int? loanPeriod;

  MoreLoanDetails(
      {this.loanId,
      this.username,
      this.firstGuarantor,
      this.secondGuarantor,
      this.loanNumber,
      this.loanedDate,
      this.branchLocation,
      this.loanedAmount,
      this.bikeNumber,
      this.loanPeriod});

  MoreLoanDetails.fromJson( json) {
    loanId = json['loan_id'];
    username = json['username'];
    firstGuarantor = json['first_guarantor'];
    secondGuarantor = json['second_guarantor'];
    loanNumber = json['loan_number'];
    loanedDate = json['loaned_date'];
    branchLocation = json['branch_location'];
    loanedAmount = json['loaned_amount'];
    bikeNumber = json['bike_number'];
    loanPeriod = json['loan_period'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['loan_id'] = loanId;
    data['username'] = username;
    data['first_guarantor'] = firstGuarantor;
    data['second_guarantor'] = secondGuarantor;
    data['loan_number'] = loanNumber;
    data['loaned_date'] = loanedDate;
    data['branch_location'] = branchLocation;
    data['loaned_amount'] = loanedAmount;
    data['bike_number'] = bikeNumber;
    data['loan_period'] = loanPeriod;
    return data;
  }
}
