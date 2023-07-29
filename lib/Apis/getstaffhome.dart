import 'dart:convert';

import '../api_endpoints.dart';
import 'package:http/http.dart' as http;

class GetStaffHomeData {
  String? staffName;
  List<LoanArrears>? loanArrears;
  String? currentDate;
  List<LoanArrearsToday>? loanArrearsToday;
  int? arrearsCount;

  GetStaffHomeData(
      {this.staffName,
      this.loanArrears,
      this.currentDate,
      this.loanArrearsToday,
      this.arrearsCount});

  GetStaffHomeData.fromJson(Map<String, dynamic> json) {
    staffName = json['staff_name'];
    if (json['loan_arrears'] != null) {
      loanArrears = <LoanArrears>[];
      json['loan_arrears'].forEach((v) {
        loanArrears!.add(LoanArrears.fromJson(v));
      });
    }
    currentDate = json['current_date'];
    if (json['loan_arrears_today'] != null) {
      loanArrearsToday = <LoanArrearsToday>[];
      json['loan_arrears_today'].forEach((v) {
        loanArrearsToday!.add(LoanArrearsToday.fromJson(v));
      });
    }
    arrearsCount = json['arrears_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['staff_name'] = staffName;
    if (loanArrears != null) {
      data['loan_arrears'] = loanArrears!.map((v) => v.toJson()).toList();
    }
    data['current_date'] = currentDate;
    if (loanArrearsToday != null) {
      data['loan_arrears_today'] =
          loanArrearsToday!.map((v) => v.toJson()).toList();
    }
    data['arrears_count'] = arrearsCount;
    return data;
  }
}

class LoanArrears {
  String? loanNumber;
  String? customerName;
  double? loanArrearsAmount;

  LoanArrears({this.loanNumber, this.customerName, this.loanArrearsAmount});

  LoanArrears.fromJson(Map<String, dynamic> json) {
    loanNumber = json['loan_number'];
    customerName = json['customer_name'];
    loanArrearsAmount = json['loan_arrears_amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['loan_number'] = loanNumber;
    data['customer_name'] = customerName;
    data['loan_arrears_amount'] = loanArrearsAmount;
    return data;
  }
}

class LoanArrearsToday {
  String? loanNumber;
  double? loanArrearsAmount;

  LoanArrearsToday({this.loanNumber, this.loanArrearsAmount});

  LoanArrearsToday.fromJson(Map<String, dynamic> json) {
    loanNumber = json['loan_number'];
    loanArrearsAmount = json['loan_arrears_amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['loan_number'] = loanNumber;
    data['loan_arrears_amount'] = loanArrearsAmount;
    return data;
  }
}

Future<GetStaffHomeData> fetchstaffhomeData(int id) async {
  var url = Uri.parse(ApiEndPoints.baseUrl +
      ApiEndPoints.authEndPoints.getStaffHomeScreenData(id));
  http.Response response = await http.get(url);
  if (response.statusCode == 200) {
    return GetStaffHomeData.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load data');
  }
}

