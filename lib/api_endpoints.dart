class ApiEndPoints {
  static const String baseUrl = "http://10.0.2.2:8000/";
  static AuthEndPoints authEndPoints = AuthEndPoints();
}

class AuthEndPoints {
  final String loginUsername = 'users/token/';
  final String listallloans = 'loans/getloans';
  String getMoreLoanDetails(int id) => 'loans/getloans/$id';
  String getCustomerLoanDetails(int id) => 'loans/getbyid/$id';
  String getLoanPaymentValues(int id) => 'loanvalues/all/$id';
}