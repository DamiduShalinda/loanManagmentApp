import 'package:flutter/material.dart';
import 'package:loan_managment_app/Apis/listmoredetails.dart';
import 'package:loan_managment_app/Pages/customer/moredetails.dart';

class OneLoan extends StatefulWidget {
  final int id;
  const OneLoan({super.key, required this.id});

  @override
  State<OneLoan> createState() => _OneLoanState();
}

class _OneLoanState extends State<OneLoan> {

  late int id;

  @override
  void initState() {
    super.initState();
    id = widget.id;
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: FutureBuilder(
        future: fetchOneLoanData(id) ,
        builder: (BuildContext context ,  AsyncSnapshot<LoanData> snapshot){
          if (snapshot.hasData) {
            final loanData = snapshot.data!;
            return MoreDetails(loanData: loanData);
          } else if (snapshot.hasError){
            return Text("Error : ${snapshot.error}");
          } else {
            return const CircularProgressIndicator();
          }
        }
        ),
    );
  }
}