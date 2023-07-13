import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loan_managment_app/Apis/getcustomerloancontroller.dart';
import 'package:loan_managment_app/Widgets/viewaloan.dart';

class HomescreenCustomer extends StatefulWidget {
  final int id;
  const HomescreenCustomer({super.key, required this.id});

  @override
  State<HomescreenCustomer> createState() => _HomescreenCustomerState();
}

class _HomescreenCustomerState extends State<HomescreenCustomer> {
  late int id;

  @override
  void initState() {
    super.initState();
    id = widget.id;
  }
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      body:  Center(
        child: FutureBuilder(
          future: fetchCustomerLoanData(id),
          builder: (context , snapshot){
            if (snapshot.hasData){
              final loanData = snapshot.data!;
              return ViewaLoan(loanData: loanData);
            }else if (snapshot.hasError){
              return Text("Error : ${snapshot.error}");
            }else{
              return const CircularProgressIndicator();
            }
          }
          ),
      ),
    );
  }
}