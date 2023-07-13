import 'package:flutter/material.dart';
import 'package:loan_managment_app/Pages/customer/listallpageforcus.dart';

import '../Apis/listallloanvalues.dart';

class LoanPaymentsList extends StatefulWidget {
  final int id;
  const LoanPaymentsList({super.key, required this.id});

  @override
  State<LoanPaymentsList> createState() => _LoanPaymentsListState();
}

class _LoanPaymentsListState extends State<LoanPaymentsList> {
  late int id;

  @override
  void initState() {
    super.initState();
    id = widget.id;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: fetchListPaymentValues(id),
          builder: (context , snapshot) {
          if (snapshot.hasData) {
            List<LoanPayments> loanData = snapshot.data!;
            return ListallPageforCus(loanData: loanData);
          } else if (snapshot.hasError){
            return Text("Error : ${snapshot.error}");
          } else {
            return const CircularProgressIndicator();
          }
          }
          ),
      ),
    );
  }
}