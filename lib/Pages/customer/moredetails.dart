import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loan_managment_app/Apis/listmoredetails.dart';


TextStyle textStyle =  const TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.bold,
  color: Colors.white
);

class MoreDetails extends StatefulWidget {
  final LoanData loanData;
  const MoreDetails({super.key, required this.loanData});
  @override
  State<MoreDetails> createState() => _MoreDetailsState();
}


class _MoreDetailsState extends State<MoreDetails> {

  var errorMessage = "".obs;
  late LoanData loanData;
  
  @override
  void initState() {
    super.initState();
    loanData = widget.loanData;
  }

  

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: IconButton(
              onPressed: (){
                Get.back();
              }, 
              icon: const Icon(Icons.arrow_back)
            ),
            expandedHeight: 400,
            flexibleSpace:  FlexibleSpaceBar(
              title: Text(loanData.loanNumber),
              background:  Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20 ,vertical: 50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      loanData.username,
                      style: textStyle,
                      ),
                    Text(
                      loanData.bikeNumber,
                      style: textStyle,
                      )
                  ],
                ),
              ),
              
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