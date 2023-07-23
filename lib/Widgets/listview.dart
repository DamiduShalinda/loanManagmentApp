import 'package:flutter/material.dart';
import 'package:loan_managment_app/Widgets/PaymentAlert.dart';

import '../modals/loanmodal.dart'; // Import the file where the Loan model is defined

class LoanListView extends StatefulWidget {
  final List<Loan> loanList;

  const LoanListView({super.key, required this.loanList});

  @override
  State<LoanListView> createState() => _LoanListViewState();
}

class _LoanListViewState extends State<LoanListView> {

  late List<Loan> loanList;
  late List<Loan> filteredLoanList;

  @override
  void initState() {
    super.initState();
    loanList = widget.loanList;
    filteredLoanList = loanList;
  }

  void _runfilter(String enteredKeyword) {
    List<Loan> results = [];
    if (enteredKeyword.isEmpty) {
      results = loanList;
    } else {
      results = loanList
          .where((loan) => loan.username.username
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
    }
    setState(() {
      filteredLoanList = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
          child: TextField(
            onChanged: (value) {
              _runfilter(value);
            },
            decoration: const InputDecoration(
                hintText: "Search by Customer Name",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)))),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: filteredLoanList.length,
            itemBuilder: (context, index) {
              Loan loan = filteredLoanList[index];
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
                    title: Text(loan.loanNumber),
                    subtitle: Text(
                        'Name: ${loan.username.username}\n'
                        'Loaned Amount: ${loan.loanedAmount.toStringAsFixed(2)}'
                        ),
                    trailing: IconButton(
                      iconSize: 50,
                      icon: const Icon(Icons.payments_outlined),
                      onPressed: () => showDialog<String>(
                        context: context,
                        builder: (BuildContext context) =>  PaymentAlert(id:int.parse(loan.loanId),)
                      ),
                    )
                ),
              ))
              ;
            },
          ),
        ),
      ],
    );
  }
}
