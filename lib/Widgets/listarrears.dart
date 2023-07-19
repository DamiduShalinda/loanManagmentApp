import 'package:flutter/material.dart';

import '../Apis/getarrears.dart';



class ListArrears extends StatefulWidget {
  final List<OneArrears> arrearsData;
  const ListArrears({super.key, required this.arrearsData});

  @override
  State<ListArrears> createState() => _ListArrearsState();
}

class _ListArrearsState extends State<ListArrears> {

  late List<OneArrears> arrearsData;

  @override
  void initState() {
    super.initState();
    arrearsData = widget.arrearsData;
  }
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: arrearsData.length,
      itemBuilder: (context , index){
        OneArrears arrears = arrearsData[index];
        Color color = index.isEven ? Colors.white : Colors.grey[200]!;
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
          child: Card(
            color: color,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ExpansionTile(
                controlAffinity: ListTileControlAffinity.leading,
                title: Text('Loan ID: ${arrears.loanId}'),
                children: [
                  ListTile(
                  titleTextStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    height: 1.5
                  ),
                  subtitleTextStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    height: 1.5
                  ),
                  title: const Text('Arrears Details'),
                  subtitle: Text('Monthly Arrears: ${arrears.monthlyArrears.toStringAsFixed(2)}\n'
                      'Arrears Months: ${(arrears.monthlyArrears/arrears.monthlyPayment).toStringAsFixed(2)}\n'
                      'Arrears Calculated Date: ${arrears.arrCalDate}'
                      ),
                  leading: const Icon(Icons.money),
                ),
                ]
              ),
            ),
          ),
        );
      }

      );
  }
}