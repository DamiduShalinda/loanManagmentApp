class ApiEndPoints {
  static const String baseUrl = "http://10.0.2.2:8000/";
  static AuthEndPoints authEndPoints = AuthEndPoints();
}

class AuthEndPoints {
  final String loginUsername = 'users/token/';
  final String listallloans = 'loans/getall';
  String getMoreLoanDetails(int id) => 'loans/get/$id';
  String getCustomerLoanDetails(int id) => 'loans/getbyid/$id';
  String getLoanPaymentValues(int id) => 'loanvalues/all/$id';
  String getOneArrears(int id) => 'arrears/getbyloanid/$id';
  final String makeapayment = 'loanvalues/update/';
  String getStaffName(int id ) => 'staff/get/$id';
  String getArrearsbyLocation(String location) => 'arrears/getbylocation/?location=$location';
  String getLoanbyLoanNum (String loanNumber) => 'loans/getbylnum/$loanNumber';
  final String getallcustomernames = 'customers/getnames';
  String getOneCustomer(int id) => 'customers/getone/$id';
  String updateProfilePicture(int id) => 'customers/getone/$id/update';
}
