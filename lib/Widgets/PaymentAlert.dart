import 'package:flutter/material.dart';

class PaymentAlert extends StatelessWidget {
  const PaymentAlert({super.key});

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
                          child: const TextField(
                            decoration: InputDecoration(
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
                        onPressed: () => Navigator.pop(context, 'OK'),
                        child: const Text('OK'),
                      ),
                    ],
                  );
  }
}