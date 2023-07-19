import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

import '../api_endpoints.dart';

class OneLoanDetails {
  int loanId;
  Username username;
  Username firstGuarantor;
  Username secondGuarantor;
  String loanNumber;
  String loanedDate;
  String branchLocation;
  double loanedAmount;
  String bikeNumber;
  int loanPeriod;

  OneLoanDetails(
      {required this.loanId,
      required this.username,
      required this.firstGuarantor,
      required this.secondGuarantor,
      required this.loanNumber,
      required this.loanedDate,
      required this.branchLocation,
      required this.loanedAmount,
      required this.bikeNumber,
      required this.loanPeriod});

  factory OneLoanDetails.fromJson(Map<String, dynamic> json) {
    return OneLoanDetails(
      loanId: json['loan_id'],
      username: Username.fromJson(json['username']),
      firstGuarantor: Username.fromJson(json['first_guarantor']),
      secondGuarantor: Username.fromJson(json['second_guarantor']),
      loanNumber: json['loan_number'],
      loanedDate: json['loaned_date'],
      branchLocation: json['branch_location'],
      loanedAmount: json['loaned_amount'],
      bikeNumber: json['bike_number'],
      loanPeriod: json['loan_period'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['loan_id'] = loanId;
    data['username'] = username.toJson();
    data['first_guarantor'] = firstGuarantor.toJson();
    data['second_guarantor'] = secondGuarantor.toJson();
    data['loan_number'] = loanNumber;
    data['loaned_date'] = loanedDate;
    data['branch_location'] = branchLocation;
    data['loaned_amount'] = loanedAmount;
    data['bike_number'] = bikeNumber;
    data['loan_period'] = loanPeriod;
    return data;
  }
}

class Username {
  int id;
  String name;
  String surname;
  String address;
  String telephone1;
  String telephone2;
  String dateofbirth;
  String nicnumber;
  int user;

  Username(
      {required this.id,
      required this.name,
      required this.surname,
      required this.address,
      required this.telephone1,
      required this.telephone2,
      required this.dateofbirth,
      required this.nicnumber,
      required this.user});

  factory Username.fromJson(Map<String, dynamic> json) {
    return Username(
      id : json['id'],
      name : json['name'],
      surname : json['surname'],
      address : json['address'],
      telephone1 : json['telephone1'],
      telephone2 : json['telephone2'],
      dateofbirth : json['dateofbirth'],
      nicnumber : json['nicnumber'],
      user : json['user'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['surname'] = surname;
    data['address'] = address;
    data['telephone1'] = telephone1;
    data['telephone2'] = telephone2;
    data['dateofbirth'] = dateofbirth;
    data['nicnumber'] = nicnumber;
    data['user'] = user;
    return data;
  }
}


Future<OneLoanDetails> fetchOneLoanDetailsData(String loanNumber) async {
  var errorMessage = "".obs;
  try {
    var url = Uri.parse(ApiEndPoints.baseUrl + ApiEndPoints.authEndPoints.getLoanbyLoanNum(loanNumber));
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      OneLoanDetails oneLoanDetails = OneLoanDetails.fromJson(body);
      return oneLoanDetails;
    } else {
      errorMessage("Something went wrong");
      throw Exception("Something went wrong"); // Throw an exception to indicate an error
    }
  } catch (e) {
    errorMessage(e.toString());
    throw Exception(e.toString()); // Throw an exception to indicate an error
  }
}