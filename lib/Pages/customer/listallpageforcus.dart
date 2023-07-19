import 'package:flutter/material.dart';
import 'package:loan_managment_app/Widgets/loanPaymentView.dart';

import '../../Apis/listallloanvalues.dart';

class ListallPageforCus extends StatefulWidget {
  final List<LoanPayments> loanData;
  const ListallPageforCus({super.key, required this.loanData});

  @override
  State<ListallPageforCus> createState() => _ListallPageforCusState();
}

class _ListallPageforCusState extends State<ListallPageforCus> {
  late List<LoanPayments> loanData;
  @override
  void initState() {
    super.initState();
    loanData = widget.loanData;
  }
  @override
  Widget build(BuildContext context) {
    if (loanData.isEmpty) {
      return const Center(
        child: Text("No Payments"),
      );
    }
    else {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Loan Payments"),
        ),
        body: ListView.builder(
          itemCount: loanData.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                onTap: () => showDialog<String>(
                    context: context,
                    builder: (BuildContext context) =>  LoanPaymentView(loanPayments: loanData[index],)
                  ),
                title: Text("Payment Amount : ${loanData[index].paymentamount.toString()}"),
                subtitle: Text("Payment Date : ${loanData[index].paymentdate}"),
              ),
            );
          },
        ),
      );
    }
  }
}