import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:loan_managment_app/Apis/getallcustomers.dart';

import '../Pages/staff/onecustomer.dart';

class ListCustomers extends StatefulWidget {
  final List<CustomersNameID> customerNameID;
  const ListCustomers({super.key, required this.customerNameID});

  @override
  State<ListCustomers> createState() => _ListCustomersState();
}

class _ListCustomersState extends State<ListCustomers> {
  late List<CustomersNameID> customerNameID;
  late List<CustomersNameID> filteredCustomerNameId;

  @override
  void initState() {
    super.initState();
    customerNameID = widget.customerNameID;
    filteredCustomerNameId = customerNameID;
  }

  void _runfilter(String enteredKeyword) {
    List<CustomersNameID> results = [];
    if (enteredKeyword.isEmpty) {
      results = customerNameID;
    } else {
      results = customerNameID
          .where((customer) => customer.name
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
    }
    setState(() {
      filteredCustomerNameId = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
          child: TextField(
            onChanged: (value) {
              _runfilter(value);
            },
            decoration: const InputDecoration(
              hintText: "Search Customer Name",
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(5.0),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: filteredCustomerNameId.length,
            itemBuilder: (context, index) {
              CustomersNameID customerNameID = filteredCustomerNameId[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  tileColor: Colors
                      .white, // Dark purple background color for the ListTile
                  contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 8.0), // Padding between content
                  leading: CircleAvatar(
                    backgroundColor: Colors.deepPurple[
                        400], // Slightly lighter purple for the circular avatar background
                    child: Text(
                      customerNameID.name[0], // Display the first character of the name
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  title: Text(
                    customerNameID.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black, // White text color
                    ),
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.deepPurple, // White arrow icon color
                  ),
                  onTap: () {
                    Get.to(() => OneCustomer(
                          id: customerNameID.id,
                        ));
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
