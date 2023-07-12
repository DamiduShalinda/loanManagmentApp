import 'dart:convert';
import 'dart:core';
import 'package:http/http.dart' as http;

class PayingAmount {
  final String paymentDate;
  final double paymentAmount;
  final int loanId; 
  
  PayingAmount({
    required this.paymentDate,
    required this.paymentAmount,
    required this.loanId,
  });

  Map<String , dynamic> toJson(){
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['payment_date'] = paymentDate;
    data['payment_amount'] = paymentAmount;
    data['loan_id'] = loanId;
    return data;
  }
}