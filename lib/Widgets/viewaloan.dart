import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loan_managment_app/Apis/getcustomerloancontroller.dart';
import 'package:loan_managment_app/Widgets/loanpaymentlist.dart';

class ViewaLoan extends StatelessWidget {
  final CustomerLoanData loanData;
  const ViewaLoan({super.key, required this.loanData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  Text("Loan ID : ${loanData.loannumber}"),
                  Text("Loan Amount : ${loanData.loanedamount.toString()}"),
                  TextButton(
                    onPressed: (){},
                    style: TextButton.styleFrom(
                      primary: Colors.white,
                      backgroundColor: Colors.blue,
                      onSurface: Colors.grey,
                      elevation: 2
              ), 
                    child: const Text("Pay a payment"),
                        ),
                ],
              ),
            ),
            TextButton(
            onPressed: () {
                  Get.to(() => LoanPaymentsList(id: loanData.loanID));
            }, 
            child: const Text("View Payments"),
            )
          ],
        ),
      )
    );
  }
}