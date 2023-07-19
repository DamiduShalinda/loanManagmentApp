import 'package:flutter/material.dart';
import 'package:loan_managment_app/Apis/listallloanvalues.dart';

class LoanPaymentView extends StatelessWidget {
  final LoanPayments loanPayments;
  const LoanPaymentView({super.key, required this.loanPayments});

  @override
  Widget build(BuildContext context) {
    return  AlertDialog(
      buttonPadding:  const EdgeInsets.all(10),
        shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        ),
      title: const Text("Payment Details"),
      content:  Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Payment Date : ${loanPayments.paymentdate}"),
          Text("Payment Amount : ${loanPayments.paymentamount.toString()}"),
          Text("Interest : ${loanPayments.interest.toString()}"),
          Text("Principal : ${loanPayments.principle.toString()}"),
          Text("Balance : ${loanPayments.balance.toString()}"),
          const SizedBox(height: 20),
          Row(
            children: [
              SizedBox(width: MediaQuery.of(context).size.width * 0.5),
              TextButton(
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.all(10),
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blue,
                  disabledForegroundColor: Colors.grey,
                ),
                onPressed: () => Navigator.pop(context), 
                child: const Text("Close") ),
            ],
          )
        ],
      ),
    );
  }
}