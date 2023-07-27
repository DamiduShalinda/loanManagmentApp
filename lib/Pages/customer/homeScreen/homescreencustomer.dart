import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loan_managment_app/Pages/customer/customerappbar.dart';
import 'package:loan_managment_app/Pages/staff/onecustomer.dart';

import '../../../Apis/gethomescreendata.dart';
import 'doublecards.dart';


class HomescreenCustomer extends StatefulWidget {
  final CustomerHomeData homeData;
  const HomescreenCustomer({Key? key,  required this.homeData}) : super(key: key);

  @override
  State<HomescreenCustomer> createState() => _HomescreenCustomerState();
}

class _HomescreenCustomerState extends State<HomescreenCustomer> {
  late CustomerHomeData homeData;

  @override
  void initState() {
    super.initState();
    homeData = widget.homeData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Theme.of(context).colorScheme.secondary,
        appBar: CustomerAppBar(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.25,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(50),
                          bottomRight: Radius.circular(50))),
                      child: SafeArea(
                        child: Text(
                          "Welcome  Back !!" ,
                          textAlign: TextAlign.center, 
                          style: TextStyle(
                              fontSize: 38,
                              letterSpacing: 6,
                              height: 2.6,
                              fontWeight: FontWeight.w500,
                              color: Theme.of(context).colorScheme.secondary
                        ),),
                      )
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.25,
                  left: 0,
                  right: 0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0 , vertical: 15),
                    child: _cardLoanDetails(
                      homeData.loanNumber ?? "No Loan Taken",
                      homeData.customerName,
                      homeData.loanedAmount ?? 0,
                      homeData.customerAddress
                    ),
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.2,
                  right: MediaQuery.of(context).size.width * 0.12,
                  child: Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                              color: Theme.of(context).colorScheme.secondary,
                              width: 7)),
                      child: _profileImage(80)),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.35,
            ),
            DoubleCards(
              lastpayment: homeData.lastPayment ?? 0,
              monthlypayment: homeData.monthlyPayment ?? 0,
              lastpaymentdate: homeData.lastPaymentDate ?? "No Payment",
              id: homeData.loanid ?? 0,
             ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.029,
            ),
            _addButton(),
          ],
        ));
  }

  Widget _profileImage(int size) => CircleAvatar(
        backgroundImage: NetworkImage(homeData.profileimage ?? "https://cdn.pixabay.com/photo/2023/06/12/05/12/bird-8057638_1280.jpg"),
        radius: size.toDouble(),
        backgroundColor: Theme.of(context).colorScheme.primary,
      );


  Widget _cardLoanDetails( String loanNumber , String name , double amount , String address) =>  Card(
    color: const Color.fromARGB(82, 255, 255, 255),
    elevation: 3,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15)),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.85,
        height: MediaQuery.of(context).size.height * 0.29,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    loanNumber,
                    style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                        height: 1.5,
                        color: Theme.of(context).colorScheme.primary),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.035,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.circle,
                        color: Theme.of(context).colorScheme.primary,
                        size: 8,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        name,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Theme.of(context).colorScheme.primary),
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 18),
                    child: Text(
                      "Name",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w200,
                          color: Theme.of(context).colorScheme.primary),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.circle,
                        color: Theme.of(context).colorScheme.primary,
                        size: 8,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        address,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: Theme.of(context).colorScheme.primary),
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 18),
                    child: Text(
                      "Address",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w200,
                          color: Theme.of(context).colorScheme.primary),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.circle,
                        color: Theme.of(context).colorScheme.primary,
                        size: 8,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        "LKR $amount" ,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: Theme.of(context).colorScheme.primary),
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 18),
                    child: Text(
                      "Loan Amount",
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w200,
                          color: Theme.of(context).colorScheme.primary),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );

    Widget _addButton() =>  Card(
      color: Theme.of(context).colorScheme.primary,
      elevation: 2,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 100.0 , vertical: 1),
        child: TextButton.icon(
          onPressed: () {
            Get.to(() => OneCustomer(id: homeData.customerid));
          },
          icon: Icon(
            Icons.account_circle_rounded,
            color: Theme.of(context).colorScheme.secondary,
            size: 24,
          ),
          label: Text(
            "  Account Details",
            style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.secondary),
          ),
        ),
      ),
    );
}
