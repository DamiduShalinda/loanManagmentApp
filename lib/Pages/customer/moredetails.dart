import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loan_managment_app/modals/allloandetailsmodal.dart';
import 'package:http/http.dart' as http;

class MoreDetails extends StatefulWidget {
  final int id;
  const MoreDetails({super.key, required this.id});
  @override
  State<MoreDetails> createState() => _MoreDetailsState();
}

//TODO Add a structure to display the details of the loan

class _MoreDetailsState extends State<MoreDetails> {

  var errorMessage = "".obs;
  String titleText = "Loan Details";
  late String bikeNumber , branchLocation , firstGuarantor , loanedDate , loanNumber , secondGuarantor , username;
  void _onclick() {
    fetchLoanDetails(widget.id);
    titleText = loanNumber;

  }

  void fetchLoanDetails(int id) async {
    print("hello");
  try {
    var url = Uri.parse("http://10.0.2.2:8000/loans/getloans/$id");
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      print(body);
      bikeNumber = body['bike_number'];
      branchLocation = body['branch_location'];
      firstGuarantor = body['first_guarantor'];
      loanedDate = body['loaned_date'];
      loanNumber = body['loan_number'];
      secondGuarantor = body['second_guarantor'];
      username = body['username'];
      print(bikeNumber);
    } else {
      errorMessage("Something went wrong");
    }
  } catch (e) {
    errorMessage(e.toString());
  }
}

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: IconButton(
              onPressed: _onclick, 
              icon: const Icon(Icons.arrow_back)
            ),
            expandedHeight: 400,
            flexibleSpace:  FlexibleSpaceBar(
              centerTitle: true,
              title: Text(titleText ),
              
            ),
            pinned: true,
          ),
          SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            return ListTile(
              title: Text('Item $index'),
            );
          },
          childCount: 100,
        ),
      ),
        ],
      )
    );
  }
}