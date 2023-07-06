import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loan_managment_app/Apis/getmoreloandetails.dart';
import 'package:loan_managment_app/api_endpoints.dart';
import 'package:loan_managment_app/modals/allloandetailsmodal.dart';
import 'package:http/http.dart' as http;

class MoreDetails extends StatefulWidget {
  final int id;
  const MoreDetails({super.key, required this.id});
  @override
  State<MoreDetails> createState() => _MoreDetailsState();
}

class _MoreDetailsState extends State<MoreDetails> {

  var errorMessage = "".obs;
  late MoreLoanDetails moreLoanDetails;

  void _onclick() {
    fetchLoanDetails(widget.id);
  }

  void fetchLoanDetails(int id) async {
    print("hello");
  try {
    var url = Uri.parse(ApiEndPoints.baseUrl + ApiEndPoints.authEndPoints.getMoreLoanDetails(id));
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
       var data = jsonDecode(response.body);
       var res = [data];
      print(res[0]);
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
              title: Text(widget.id.toString()),
              
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