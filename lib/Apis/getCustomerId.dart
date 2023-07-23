import 'dart:convert';
import 'package:http/http.dart' as http;

import '../api_endpoints.dart';


class CustomerId {
  int userId;
  String loanNumber;

  CustomerId({
    required this.userId, 
    required this.loanNumber
    });

  factory CustomerId.fromJson(Map<String, dynamic> json) {
   return CustomerId(
      userId : json['userId'],
      loanNumber : json['loan_number']
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['loan_number'] = loanNumber;
    return data;
  }
}


Future<CustomerId> fetchOneCustomerId(String loanNumber) async {
  var url = Uri.parse(ApiEndPoints.baseUrl + ApiEndPoints.authEndPoints.getCustomerId(loanNumber));
  http.Response response = await http.get(url);
  if (response.statusCode == 200) {
    return CustomerId.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load data');
  }
}
