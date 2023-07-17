import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import  'package:intl/intl.dart';
import 'package:loan_managment_app/Apis/makeapaymentcontroller.dart';

class PaymentAlert extends StatefulWidget {
  final int id;
  const PaymentAlert({super.key, required this.id});

  @override
  State<PaymentAlert> createState() => _PaymentAlertState();
}

class _PaymentAlertState extends State<PaymentAlert> {
  final TextEditingController _amountController = TextEditingController();
  late int id;
  late PaymentDetails _paymentDetails;

  String cdate = DateFormat("yyyy-MM-dd").format(DateTime.now());

  @override
  void initState() {
    super.initState();
    id = widget.id;
  }

  void _updateValues(context) {
    _paymentDetails.loanNumber = id;
    _paymentDetails.paymentDate = cdate;
    _paymentDetails.paymentAmount =  int.parse(_amountController.text);
    Navigator.pop(context, 'OK');
    sendPaymentDetails(_paymentDetails);
    }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
                    buttonPadding: const EdgeInsets.all(10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    title: const Text('Payment'),
                    content:  Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      
                      children: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 30),
                          child:  const Text('Enter the payment amount:')),
                        Container(
                          margin: const EdgeInsets.only(bottom: 10),
                          width: 300,
                          child:  TextField(
                            keyboardType: TextInputType.number,
                            controller: _amountController,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Payment Amount',
                            ),
                          ),
                        ),
                      ],
                    ),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () => Navigator.pop(context, 'Cancel'),
                        child: const Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () => _updateValues(context),
                        child: const Text('OK'),
                      ),
                    ],
                  );
  }
}