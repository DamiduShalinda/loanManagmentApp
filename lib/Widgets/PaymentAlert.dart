import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import  'package:intl/intl.dart';

class PaymentAlert extends StatefulWidget {
   const PaymentAlert({super.key});

  @override
  State<PaymentAlert> createState() => _PaymentAlertState();
}

class _PaymentAlertState extends State<PaymentAlert> {
  final TextEditingController _amountController = TextEditingController();

  String cdate = DateFormat("yyyy-MM-dd").format(DateTime.now());

  void _updateValues(context) {
    Navigator.pop(context, 'OK');
    if (kDebugMode) {
      print('Payment Amount: ${_amountController.text}' +
          '\nDate: $cdate');
  
    }}

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
                          margin: const EdgeInsets.only(bottom: 10),
                          child:  const Text('Monthly Payment:')),
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