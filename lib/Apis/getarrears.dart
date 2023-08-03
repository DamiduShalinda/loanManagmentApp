import 'dart:convert';
import 'package:get/get.dart';
import '../api_endpoints.dart';
import 'package:http/http.dart' as http;

class OneArrears {
  int id;
  String loanId;
  double monthlyPayment;
  double monthlyArrears;
  String arrCalDate;
  double additionalFees;
  String? staff;
  int? loanValues;

  OneArrears({
      required this.id,
      required this.loanId,
      required this.monthlyPayment,
      required this.monthlyArrears,
      required this.arrCalDate,
      required this.additionalFees,
      this.staff,
      this.loanValues
      });

  factory OneArrears.fromJson(Map<String, dynamic> json) {
   return OneArrears(
      id : json['id'],
      loanId : json['loan_id'],
      monthlyPayment : json['monthly_payment'],
      monthlyArrears : json['monthly_arrears'],
      arrCalDate : json['arr_cal_date'],
      additionalFees : json['additional_fees'],
      staff : json['staff'],
      loanValues : json['loan_values'],
    );
  }

}

Future<OneArrears> fetchOneArrearsData(int id) async {
  var errorMessage = "".obs;
  try {
    var url = Uri.parse(ApiEndPoints.baseUrl + ApiEndPoints.authEndPoints.getOneArrears(id));
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      OneArrears oneArrears = OneArrears.fromJson(body);
      return oneArrears;
    } else {
      errorMessage("Something went wrong");
      throw Exception("Something went wrong"); // Throw an exception to indicate an error
    }
  } catch (e) {
    errorMessage(e.toString());
    throw Exception(e.toString()); // Throw an exception to indicate an error
  }
}


Future <List<OneArrears>> fetchByAddress( String location){
  var errorMessage = "".obs;
  return http.get(Uri.parse(ApiEndPoints.baseUrl + ApiEndPoints.authEndPoints.getArrearsbyLocation(location)))
      .then((http.Response response){
    final List<OneArrears> oneArrears = [];
    if (response.statusCode == 200){
      var body = jsonDecode(response.body);
      for (var item in body){
        oneArrears.add(OneArrears.fromJson(item));
      }
      return oneArrears;
    }else{
      errorMessage("Something went wrong");
      throw Exception("Something went wrong");
    }
  });
}