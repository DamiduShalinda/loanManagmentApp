import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:loan_managment_app/api_endpoints.dart';

class PaymentDetails {
  String paymentDate;
  int paymentAmount;
  int loanNumber;

  PaymentDetails({
    required this.paymentDate, 
    required this.paymentAmount, 
    required this.loanNumber});

  factory PaymentDetails.fromJson(Map<String, dynamic> json) {
    return PaymentDetails(
      paymentDate : json['payment_date'],
      paymentAmount : json['payment_amount'],
      loanNumber : json['loan_number'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['payment_date'] = paymentDate;
    data['payment_amount'] = paymentAmount;
    data['loan_number'] = loanNumber;
    return data;
  }
}

void sendPaymentDetails( PaymentDetails paymentDetails ) async {
 
  String payload = jsonEncode(paymentDetails.toJson());
  String url = ApiEndPoints.baseUrl + ApiEndPoints.authEndPoints.makeapayment;

  try {
    // Send the POST request
    http.Response response = await http.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: payload,
    );

    // Check the response status code
    if (response.statusCode == 200) {
      // Display the response in a toast message
      Fluttertoast.showToast(
        msg: 'Response: ${response.body}',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
      );
    } else {
      // Handle error cases
      Fluttertoast.showToast(
        msg: 'Error: ${response.statusCode}',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
      );
    }
  } catch (e) {
    // Handle network or other errors
    Fluttertoast.showToast(
      msg: 'Error: $e',
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
    );
  }
}


