import 'package:flutter/material.dart';
import 'package:loan_managment_app/Apis/getarrears.dart';
import 'package:loan_managment_app/Apis/getstaffidcontroller.dart';
import 'package:loan_managment_app/Widgets/listarrears.dart';

class ViewArrears extends StatefulWidget {

  final StaffName staffName;
  const ViewArrears({super.key, required this.staffName});

  @override
  State<ViewArrears> createState() => _ViewArrearsState();
}

class _ViewArrearsState extends State<ViewArrears> {

  late StaffName staffName;

  @override
  void initState() {
    super.initState();
    staffName = widget.staffName;
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: FutureBuilder(
        future: fetchByAddress(staffName.assignedLocation),
        builder: (context , snapshot){
          if (snapshot.hasData) {
            List<OneArrears> arrearsData = snapshot.data!;
            return ListArrears(arrearsData: arrearsData);
          }
          else if (snapshot.hasError){
            return Text("Error : ${snapshot.error}");
        }else{
          return const CircularProgressIndicator();
        }
        }
        ),
    );
  }

}