import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loan_managment_app/Widgets/ListView.dart';
import '../../Apis/listallloancontroller.dart';
import '../../modals/loanmodal.dart';


class ListLoans extends StatefulWidget {
  const ListLoans({super.key});

  @override
  State<ListLoans> createState() => _ListLoansState();
}

class _ListLoansState extends State<ListLoans> with WidgetsBindingObserver {
  
  ListAllLoanController listAllLoanController = Get.put(ListAllLoanController());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Center(
        child: FutureBuilder(
          future: listAllLoanController.fetchListAllLoan(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return LoanListView(loanList: listAllLoanController.loanList);
            } else if (snapshot.hasError){
              return Text("Error : ${snapshot.error}");
            } else{
              return  const CircularProgressIndicator();
            }
         } 
    ),
    ),
    );
  }
}
