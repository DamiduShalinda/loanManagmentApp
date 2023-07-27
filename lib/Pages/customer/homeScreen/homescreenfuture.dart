import 'package:flutter/material.dart';
import 'package:loan_managment_app/Pages/customer/homeScreen/homescreencustomer.dart';

import '../../../Apis/gethomescreendata.dart';

class HomeScreenFuture extends StatefulWidget {
  final int id;
  const HomeScreenFuture({super.key, required this.id});

  @override
  State<HomeScreenFuture> createState() => _HomeScreenFutureState();
}

class _HomeScreenFutureState extends State<HomeScreenFuture> {

  late int id;

  @override
  void initState() {
    super.initState();
    id = widget.id;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: fetchCustomerHomeData(id),
        builder: (context , snapshot) {
          if(snapshot.hasData){
            CustomerHomeData homeData = snapshot.data!;
            if (homeData.loanedAmount == null) {
              return const Center(child: Text("No Loan Taken"));
            }else {
              return HomescreenCustomer(homeData: homeData);
            }
          }
          else if(snapshot.hasError){
            return Text("${snapshot.error}");
          }
          return const CircularProgressIndicator();
        }
        )
      
      )
      ;
  }
}