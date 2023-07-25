import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loan_managment_app/Apis/getcustomerloancontroller.dart';
import 'package:loan_managment_app/Widgets/viewaloan.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Widgets/PaymentAlert.dart';
import '../../Widgets/handlingcustomerid.dart';
import '../../Widgets/loanpaymentlist.dart';
import '../../Widgets/viewonearrears.dart';
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


//from viewaloan.dart

class ViewaLoan extends StatelessWidget {
  final CustomerLoanData loanData;
  const ViewaLoan({super.key, required this.loanData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                  side: BorderSide(color: Colors.grey.shade200)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        loanData.loannumber,
                        style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                        ),
                        const SizedBox(height: 10,),
                      Text(
                        "Amount : ${loanData.loanedamount.toString()}",
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                        ),
                      const SizedBox(height: 10,),
                     
                      TextButton(
                        onPressed: (){
                          Get.to(() => PaymentAlert(id: loanData.loanID));
                        },
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: const Color.fromARGB(255, 21, 31, 44),
                          disabledForegroundColor: Colors.grey,
                          elevation: 2
                          ), 
                        child: const Padding(
                          padding: EdgeInsets.symmetric(vertical: 3.0),
                          child: Text("Pay a payment"),
                        ),
                            ),
                    ],
                  ),
                ),
              ),
            ),
            
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: ViewOneArrears(id: loanData.loanID)
            ),
            const Expanded(child: SizedBox(height: 10)),
            
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextButton(
              style: TextButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Theme.of(context).colorScheme.primary,
                            disabledForegroundColor: Colors.grey,
                            elevation: 2
                            ), 
              onPressed: () {
                    Get.to(() => GetCustomerId(loanNumber: loanData.loannumber));
              }, 
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 3.0),
                child: Text("View Customer Details"),
              ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextButton(
              style: TextButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Theme.of(context).colorScheme.primary,
                            disabledForegroundColor: Colors.grey,
                            elevation: 2
                            ), 
              onPressed: () {
                    Get.to(() => LoanPaymentsList(id: loanData.loanID));
              }, 
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 3.0),
                child: Text("View Payments"),
              ),
              ),
            ),
          ],
        ),
      )
    );
  }
}
