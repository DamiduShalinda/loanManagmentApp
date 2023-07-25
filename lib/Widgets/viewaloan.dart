import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loan_managment_app/Apis/getcustomerloancontroller.dart';
import 'package:loan_managment_app/Widgets/PaymentAlert.dart';
import 'package:loan_managment_app/Widgets/loanpaymentlist.dart';

class ViewaLoan extends StatelessWidget {
  final CustomerLoanData loanData;
  const ViewaLoan({super.key, required this.loanData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                  side: BorderSide(color: Colors.grey.shade200)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        loanData.loannumber,
                        style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                        ),
                        const SizedBox(height: 10,),
                      Text(
                        "Amount : ${loanData.loanedamount.toString()}",
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                        ),
                      const SizedBox(height: 10,),
                     
                      TextButton(
                        onPressed: (){
                          Get.to(() => PaymentAlert(id: loanData.loanID));
                        },
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: const Color.fromARGB(255, 21, 31, 44),
                          disabledForegroundColor: Colors.grey,
                          elevation: 2
                          ), 
                        child: const Padding(
                          padding: EdgeInsets.symmetric(vertical: 3.0),
                          child: Text("Pay a payment"),
                        ),
                            ),
                    ],
                  ),
                ),
              ),
            ),
            
          ],
        ),
      )
    );
  }
}
