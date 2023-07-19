import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:loan_managment_app/Widgets/viewoneloan.dart';

import '../Apis/getarrears.dart';



class ListArrears extends StatefulWidget {
  final List<OneArrears> arrearsData;
  const ListArrears({super.key, required this.arrearsData});

  @override
  State<ListArrears> createState() => _ListArrearsState();
}

class _ListArrearsState extends State<ListArrears> {

  late List<OneArrears> arrearsData;
  late List<OneArrears> filteredArrearsData;

  @override
  void initState() {
    super.initState();
    arrearsData = widget.arrearsData;
    filteredArrearsData = arrearsData;
  }

  void _runfilter(String enteredKeyword) {
    List<OneArrears> results = [];
    if (enteredKeyword.isEmpty) {
      results = arrearsData;
    } else {
      results = arrearsData
        .where((arrears) => arrears.loanId.toLowerCase()
        .contains(enteredKeyword.toLowerCase()))
        .toList();
    }
    setState(() {
      filteredArrearsData = results;
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
              // setState(() {
              //   filteredArrearsData = arrearsData.where((arrears) => arrears.loanId.toLowerCase().contains(value.toLowerCase())).toList();
              // });
              _runfilter(value);
            },
            decoration: const InputDecoration(
              hintText: "Search by Loan ID",
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.0))
              )
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: filteredArrearsData.length,
            itemBuilder: (context , index){
              OneArrears arrears = filteredArrearsData[index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                child: Card(
                  child: Column(
                    children: [
                      ListTile(
                          titleTextStyle: const TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            height: 2
                          ),
                          
                          title: Text(
                              'Loan ID: ${arrears.loanId}\n'
                              'Monthly Arrears: ${arrears.monthlyArrears.toStringAsFixed(2)}\n'
                              'Arrears Months: ${(arrears.monthlyArrears/arrears.monthlyPayment).toStringAsFixed(2)}\n'
                              'Arrears Calculated Date: ${arrears.arrCalDate}'
                              ),
                          leading: const Icon(Icons.money),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextButton(
                                onPressed: (){
                                  Get.to(() => ViewOneLoan(loanNumber: arrears.loanId,));
                                }, 
                                child: const Text("View Loan Details")
                                ),
                            ),
                            const SizedBox(width: 10,),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextButton(
                                onPressed: (){}, 
                                child: const Text("View Customer Details")
                                ),
                            ),
                          ],
                        )
                    ],
                  ),
                ),
              );
            }
        
            ),
        ),
      ],
    );
  }
}
