import 'package:flutter/material.dart';
import 'package:loan_managment_app/Widgets/PaymentAlert.dart';

import '../modals/loanmodal.dart'; // Import the file where the Loan model is defined

class LoanListView extends StatelessWidget {
  final List<Loan> loanList;

  const LoanListView({super.key, required this.loanList});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: loanList.length,
      itemBuilder: (context, index) {
        Loan loan = loanList[index];
        return Padding(
          padding: const EdgeInsets.all(8.0),
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
              title: Text('Loan ID: ${loan.loanId}'),
              subtitle: Text('Username: ${loan.username}\n'
                  'Loaned Date: ${loan.loanedDate}\n'
                  'Branch Location: ${loan.branchLocation}\n'
                  'Loaned Amount: ${loan.loanedAmount.toStringAsFixed(2)}'),
              trailing: IconButton(
                iconSize: 50,
                icon: const Icon(Icons.payments_outlined),
                onPressed: () => showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => const PaymentAlert()
                ),
              )
          ),
        ))
        ;
      },
    );
  }
}
