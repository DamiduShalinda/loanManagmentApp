import 'package:flutter/material.dart';
import 'package:loan_managment_app/Apis/getstaffhome.dart';
import 'package:loan_managment_app/Pages/staff/homestaff/home.dart';

class StaffHomeFuture extends StatefulWidget {
  final int id;
  const StaffHomeFuture({super.key, required this.id});

  @override
  State<StaffHomeFuture> createState() => _StaffHomeFutureState();
}

class _StaffHomeFutureState extends State<StaffHomeFuture> {
  late int id;

  @override
  void initState() {
    super.initState();
    id = widget.id;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: fetchstaffhomeData(id),
        builder: (context , snapshot){
          if (snapshot.hasData) {
            GetStaffHomeData staffHomeData = snapshot.data!;
            return HomeScreen(staffHomeData: staffHomeData);
          }
          else if (snapshot.hasError){
            return Text("Error : ${snapshot.error}");
        }else{
          return const Center(child: CircularProgressIndicator());
        }
        }
      )
    );
  }
}