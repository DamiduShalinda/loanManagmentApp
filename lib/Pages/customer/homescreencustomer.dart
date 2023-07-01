import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomescreenCustomer extends StatefulWidget {
  const HomescreenCustomer({super.key});

  @override
  State<HomescreenCustomer> createState() => _HomescreenCustomerState();
}

class _HomescreenCustomerState extends State<HomescreenCustomer> {
  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      body:  Center(
        child: Text('Customer Home Screen'),
      ),
    );
  }
}