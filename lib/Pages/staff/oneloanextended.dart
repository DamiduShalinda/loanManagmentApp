import 'package:flutter/material.dart';
import 'package:loan_managment_app/Apis/getoneloandetails.dart';

import '../../Apis/listallloanvalues.dart';
import '../../Widgets/loanPaymentView.dart';

TextStyle textStyle = const TextStyle(
  color: Colors.black,
  fontSize: 20,
  fontWeight: FontWeight.normal,
  height: 1.5
);

class OneLoanExtended extends StatefulWidget {
  final OneLoanDetails oneLoanDetails;
  final List<LoanPayments> loanPayments;
  const OneLoanExtended({super.key, required this.oneLoanDetails, required this.loanPayments});

  @override
  State<OneLoanExtended> createState() => _OneLoanExtendedState();
}

class _OneLoanExtendedState extends State<OneLoanExtended> {
  
  late OneLoanDetails oneLoanDetails;
  late List<LoanPayments> loanPayments;

  @override
  void initState() {
    super.initState();
    oneLoanDetails = widget.oneLoanDetails;
    loanPayments = widget.loanPayments;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text(oneLoanDetails.loanNumber),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Card(
              elevation: 2, // Set the elevation to add a shadow effect
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0), // Set the card border radius
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      oneLoanDetails.username.name,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        height: 1
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Address: ${oneLoanDetails.username.address}',
                      style: const TextStyle(fontSize: 16 , height: 1.5),
                    ),
                    const SizedBox(height: 4),
                   Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          child: Text(
                            'Telephone: ${oneLoanDetails.username.telephone1}',
                            style: const TextStyle(fontSize: 16 , height: 1.5),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            oneLoanDetails.username.telephone2,
                            style: const TextStyle(fontSize: 16 , height: 1.5),
                          ),
                        ),
                      ],
                    ),
                    const Divider(),
                    const SizedBox(height: 8),
                    Text(
                      'Loaned Amount: ${oneLoanDetails.loanedAmount.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        height: 1.5
                      ),
                    ),
                    Text(
                      'Loaned Date: ${oneLoanDetails.loanedDate}',
                      style: const TextStyle(
                        fontSize: 16,
                        height: 1.5
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Bike Number: ${oneLoanDetails.bikeNumber}',
                      style: const TextStyle(fontSize: 16 , height: 1.5),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
           Expanded(
              child: Card(
                color: Colors.grey[100],
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: ListView.builder(
                  itemCount: loanPayments.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      
                      onTap: () => showDialog<String>(
                          context: context,
                          builder: (BuildContext context) =>
                              LoanPaymentView(loanPayments: loanPayments[index]),
                        ),
                      title: Text("Payment Amount : ${loanPayments[index].paymentamount.toString()}"),
                      subtitle: Text("Payment Date : ${loanPayments[index].paymentdate}"),
                    );
                },
              ),
            ),
            )
          ],
        ),
        
      ),
    );
  }
}
