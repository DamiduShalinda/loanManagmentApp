import 'package:flutter/material.dart';

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
          child: Card(
            child: ListTile(
              title: Text('Loan ID: ${loan.loanId}'),
              subtitle: Text('Username: ${loan.username}\n'
                  'Loaned Date: ${loan.loanedDate}\n'
                  'Branch Location: ${loan.branchLocation}\n'
                  'Loaned Amount: ${loan.loanedAmount.toStringAsFixed(2)}'),
            ),
          ),
        );
      },
    );
  }
}
