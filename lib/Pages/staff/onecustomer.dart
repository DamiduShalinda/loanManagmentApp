import 'package:flutter/material.dart';
import 'package:loan_managment_app/Apis/getonecustomer.dart';
import 'package:loan_managment_app/Pages/customer/morecustomerdetails.dart';

class OneCustomer extends StatefulWidget {
  final int id;
  const OneCustomer({super.key, required this.id});

  @override
  State<OneCustomer> createState() => _OneCustomerState();
}

class _OneCustomerState extends State<OneCustomer> {

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
        future: fetchOneCustomer(id) ,
        builder: (BuildContext context , snapshot){
          if (snapshot.hasData) {
            final onecustomer = snapshot.data!;
            return MoreCustomerDetails(oneCustomer: onecustomer);
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