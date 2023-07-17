import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loan_managment_app/Apis/getcustomerloancontroller.dart';
import 'package:loan_managment_app/Widgets/viewaloan.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../staff/login.dart';

class HomescreenCustomer extends StatefulWidget {
  final int id;
  const HomescreenCustomer({super.key, required this.id});

  @override
  State<HomescreenCustomer> createState() => _HomescreenCustomerState();
}

class _HomescreenCustomerState extends State<HomescreenCustomer> {
  late int id;
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  void initState() {
    super.initState();
    id = widget.id;
  }
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      appBar: AppBar(
        title: const Text('Loan Management App'),
        actions: [
          IconButton(
            onPressed: () async {
              final SharedPreferences prefs = await _prefs;
              prefs.clear();
              Get.offAll(() => const Login());
            },
            icon: const Icon(Icons.logout),
          ),
         ],
      ),
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