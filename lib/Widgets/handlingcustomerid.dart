import 'package:flutter/material.dart';
import 'package:loan_managment_app/Pages/staff/onecustomer.dart';
import '../Apis/getCustomerId.dart';

class GetCustomerId extends StatefulWidget {
  final String loanNumber;
  const GetCustomerId({super.key, required this.loanNumber});

  @override
  State<GetCustomerId> createState() => _GetCustomerIdState();
}

class _GetCustomerIdState extends State<GetCustomerId> {
  late String loanNumber;

  @override
  void initState() {
    super.initState();
    loanNumber = widget.loanNumber;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fetchOneCustomerId(loanNumber),
      builder: (context , snapshot){
        if (snapshot.hasData) {
          CustomerId customerId = snapshot.data!;
          return OneCustomer(id: customerId.userId);
        }
        else if (snapshot.hasError){
          return Text("Error : ${snapshot.error}");
        }else{
          return const CircularProgressIndicator();
        }
      }
    
    );
  }
}