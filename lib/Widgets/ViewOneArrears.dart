import 'package:flutter/material.dart';
import 'package:loan_managment_app/Apis/getonearrears.dart';

class ViewOneArrears extends StatefulWidget {
  final int id;
  const ViewOneArrears({super.key, required this.id});

  @override
  State<ViewOneArrears> createState() => _ViewOneArrearsState();
}

class _ViewOneArrearsState extends State<ViewOneArrears> {
  late int id;

  @override
  void initState() {
    super.initState();
    id = widget.id;
  }
  @override
  Widget build(BuildContext context) {
    return  Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                    side: BorderSide(color: Colors.grey.shade200)
                  ),
                child:   Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: FutureBuilder(
                    future: fetchOneArrearsData(id),
                    builder: (context , snapshot) {
                      if (snapshot.hasData){
                        final arrearsData = snapshot.data!;
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              "Monthly Arrears : ${arrearsData.monthlyArrears.toString()}",
                              style: const TextStyle(
                                fontSize: 17,
                              ),
                              ),
                            const SizedBox(height: 7),
                            Text(
                              "Monthly Payment : ${arrearsData.monthlyPayment.toString()}",
                              style: const TextStyle(
                                fontSize: 17,
                              ),
                              ),
                            const SizedBox(height: 7),
                            Text(
                              "Arrears Calculated Date : ${arrearsData.arrCalDate}",
                              style: const TextStyle(
                                fontSize: 17,
                              ),
                              ),
                            const SizedBox(height: 10,),
                          ],
                        );
                      }else if (snapshot.hasError){
                        return const Text("No Arrears");
                      }else{
                        return const CircularProgressIndicator();
                      }
                    }
                    ),
                )
              );      
  }
}