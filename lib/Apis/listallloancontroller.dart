import 'package:get/get.dart';
import 'package:loan_managment_app/api_endpoints.dart';
import 'package:http/http.dart' as http;
import 'package:loan_managment_app/modals/loanmodal.dart';

class ListAllLoanController extends GetxController {
  var errorMessage = "".obs;

  List<Loan> loanList = <Loan>[];


 Future<void> fetchListAllLoan() async {
    try {
      var url = Uri.parse(ApiEndPoints.baseUrl + ApiEndPoints.authEndPoints.listallloans);
      http.Response response = await http.get(url);
      if (response.statusCode == 200) {
        loanList = fetchList(response);
      } else {
        errorMessage("Something went wrong");
      }
    } catch (e) {
      errorMessage(e.toString());
    } 
  }
}
