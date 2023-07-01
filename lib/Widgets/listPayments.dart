import 'package:flutter/material.dart';
import '../modals/loanpaymentsmodal.dart'; // Import the file where the Loan model is defined

class PaymentListView extends StatelessWidget {
  final List<LoanPayments> paymentlist;

  const PaymentListView({super.key, required this.paymentlist});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      child: ListView.builder(
        itemCount: paymentlist.length,
        itemBuilder: (context, index) {
          LoanPayments payments = paymentlist[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            child: Container(
              
              decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(width: 1.5, 
                color: Colors.black),
              ),
            ),
              child: ListTile(
                titleTextStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  height: 1
                ),
                subtitleTextStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  height: 2
                ),
                title: Text('Loan ID: ${payments.loanId}'),
                subtitle: Text('Username: ${payments.username}\n'
                    'Payment Date: ${payments.paymentDate}\n'
                    'Payment Amount: ${payments.paymentAmount.toStringAsFixed(2)}\n'
                    'Interest: ${payments.interest.toStringAsFixed(2)}\n'
                    'Principal: ${payments.principal.toStringAsFixed(2)}\n'
                    'Balance: ${payments.balance.toStringAsFixed(2)}\n'
                    ),
              ),
            ),
          );
        },
      ),
    );
  }
}


