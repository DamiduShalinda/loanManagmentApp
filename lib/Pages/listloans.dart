import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Apis/listallloancontroller.dart';


class ListLoans extends StatefulWidget {
  const ListLoans({super.key});

  @override
  State<ListLoans> createState() => _ListLoansState();
}

class _ListLoansState extends State<ListLoans> with WidgetsBindingObserver {
  
  ListAllLoanController listAllLoanController = Get.put(ListAllLoanController());

  // @override
  // void initState() {
  //   super.initState();
  //   WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
  //     listAllLoanController.fetchListAllLoan();
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Loans'),
      ),
      body:  Center(
        child: TextButton(
          onPressed: () {
            listAllLoanController.fetchListAllLoan();
          }, 
          child: const Text("List Loans")),
      ),
    );
  }
}


class Loan {
  final String loanId;
  final String username;
  final String loanedDate;
  final String branchLocation;
  final double loanedAmount;

  Loan({
    required this.loanId,
    required this.username,
    required this.loanedDate,
    required this.branchLocation,
    required this.loanedAmount,
  });

  factory Loan.fromJson(Map<String, dynamic> json) {
    return Loan(
      loanId: json['loan_id'],
      username: json['username'],
      loanedDate: json['loaned_date'],
      branchLocation: json['branch_location'],
      loanedAmount: double.parse(json['loaned_amount']),
    );
  }
}