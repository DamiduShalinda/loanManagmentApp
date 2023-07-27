import 'dart:convert';

import '../api_endpoints.dart';
import 'package:http/http.dart' as http;

class CustomerHomeData {
  String? loanNumber;
  String customerName;
  String customerAddress;
  String? profileimage;
  double? loanedAmount;
  double? lastPayment;
  String? lastPaymentDate;
  double? arrears;
  String? arrearsDate;
  double? monthlyPayment;
  int? loanid;
  int customerid;

  CustomerHomeData(
      {this.loanNumber,
      required this.customerName,
      required this.customerAddress,
      this.profileimage,
      this.loanedAmount,
      this.lastPayment,
      this.lastPaymentDate,
      this.arrears,
      this.arrearsDate,
      this.monthlyPayment,
      this.loanid,
      required this.customerid
      });

  factory CustomerHomeData.fromJson(Map<String, dynamic> json) {
    return CustomerHomeData(
    loanNumber : json['loan_number'],
    customerName : json['customer_name'],
    customerAddress : json['customer_address'],
    profileimage : json['profileimage'],
    loanedAmount : json['loaned_amount'],
    lastPayment : json['last_payment'],
    lastPaymentDate : json['last_payment_date'],
    arrears : json['arrears'],
    arrearsDate : json['arrears_date'],
    monthlyPayment : json['monthly_payment'],
    loanid : json['loan_id'],
    customerid : json['customer_id']
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['loan_number'] = loanNumber;
    data['customer_name'] = customerName;
    data['customer_address'] = customerAddress;
    data['profileimage'] = profileimage;
    data['loaned_amount'] = loanedAmount;
    data['last_payment'] = lastPayment;
    data['last_payment_date'] = lastPaymentDate;
    data['arrears'] = arrears;
    data['arrears_date'] = arrearsDate;
    return data;
  }
}

Future<CustomerHomeData> fetchCustomerHomeData(int id) async {
  var url = Uri.parse(ApiEndPoints.baseUrl + ApiEndPoints.authEndPoints.getHomeScreenData(id));
  http.Response response = await http.get(url);
  if (response.statusCode == 200) {
    return CustomerHomeData.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load data');
  }
}