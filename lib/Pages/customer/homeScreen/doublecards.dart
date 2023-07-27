import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Widgets/PaymentAlert.dart';
import '../../../Widgets/loanpaymentlist.dart';

class DoubleCards extends StatelessWidget {

  final double lastpayment;
  final double monthlypayment;
  final String lastpaymentdate;
  final int id;
  
  const DoubleCards({
    super.key, required this.lastpayment, required this.monthlypayment, required this.lastpaymentdate, required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0 , vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Card(
              color: Theme.of(context).colorScheme.primary,
              elevation: 3,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              child: InkWell(
                onTap: () {
                   Get.to(() =>  LoanPaymentsList(id: id));
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary,
                      borderRadius: BorderRadius.circular(15)),
                  width: MediaQuery.of(context).size.width * 0.2,
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.account_balance_wallet_rounded,
                          color: Theme.of(context).colorScheme.primary,
                          size: 30,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          "LKR $lastpayment",
                          style: TextStyle(
                              fontSize: 17,
                              height: 2,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.primary),
                        ),
                        Text(
                          "Last Payment",
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w300,
                              color: Theme.of(context).colorScheme.primary),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                      Text(
                          lastpaymentdate,
                          style: TextStyle(
                              fontSize: 17,
                              height: 2,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.primary),
                        ),
                        Text(
                          "Date",
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w300,
                              color: Theme.of(context).colorScheme.primary),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 30,
          ),
          Expanded(
            child: Card(
              color: Theme.of(context).colorScheme.primary,
              elevation: 3,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              child: Container(
                
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    borderRadius: BorderRadius.circular(15)),
                width: MediaQuery.of(context).size.width * 0.2,
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.account_box,
                        color: Theme.of(context).colorScheme.primary,
                        size: 30,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "LKR $monthlypayment",
                        style: TextStyle(
                            fontSize: 17,
                            height: 2,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.primary),
                      ),
                      Text(
                        "Monthly Payment",
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w300,
                            color: Theme.of(context).colorScheme.primary),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                    ActionChip(
                      label: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0 , vertical: 5.0),
                      child: Text("Pay Now"),
                    ), onPressed: (){
                      Get.to(() => PaymentAlert(id: id));
                    })
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
