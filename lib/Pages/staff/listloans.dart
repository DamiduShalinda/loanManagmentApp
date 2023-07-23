import 'package:flutter/material.dart';
import 'package:loan_managment_app/Widgets/ListView.dart';
import 'package:loan_managment_app/modals/loanmodal.dart';


class ListLoans extends StatefulWidget {
  const ListLoans({super.key});

  @override
  State<ListLoans> createState() => _ListLoansState();
}

class _ListLoansState extends State<ListLoans> with WidgetsBindingObserver {
  


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      body:  Center(
        child: FutureBuilder(
          future: fetchList(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return LoanListView(loanList: snapshot.data!);
            } else if (snapshot.hasError){
              return Text("Error : ${snapshot.error}");
            } else{
              return  const CircularProgressIndicator();
            }
         } 
    ),
    ),
    );
  }
}
