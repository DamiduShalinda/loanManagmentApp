import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loan_managment_app/Widgets/ListView.dart';
import '../../Apis/listallloancontroller.dart';


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
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      listAllLoanController.fetchListAllLoan();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Center(
        child: LoanListView(loanList: listAllLoanController.loanList)
    ),
    );
  }
}
