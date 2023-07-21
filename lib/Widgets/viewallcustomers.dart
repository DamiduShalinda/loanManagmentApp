import 'package:flutter/material.dart';
import 'package:loan_managment_app/Widgets/listcustomers.dart';

import '../Apis/getallcustomers.dart';

class ViewAllCustomers extends StatefulWidget {
  const ViewAllCustomers({super.key});

  @override
  State<ViewAllCustomers> createState() => _ViewAllCustomersState();
}

class _ViewAllCustomersState extends State<ViewAllCustomers> {

  List<CustomersNameID> filteredCustomerNameId = [];

  void _runfilter(String enteredKeyword) {
    List<CustomersNameID> results = [];
    if (enteredKeyword.isEmpty) {
      results = filteredCustomerNameId;
    } else {
      results = filteredCustomerNameId
        .where((customer) => customer.name.toLowerCase()
        .contains(enteredKeyword.toLowerCase()))
        .toList();
    }
    setState(() {
      filteredCustomerNameId = results;
    });
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.grey[200],
      body: Center(
        child: FutureBuilder(
          future: fetchAllCustomersNames(),
          builder: (context , snapshot){
            if (snapshot.hasData) {
              List<CustomersNameID> customersNameID = snapshot.data!;
              return ListCustomers(customerNameID: customersNameID);
              
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return const CircularProgressIndicator();
          }
          ),
      ),
    );
  }
}