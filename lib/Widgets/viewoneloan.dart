import 'package:flutter/material.dart';
import 'package:loan_managment_app/Apis/listallloanvalues.dart';
import '../Apis/getoneloandetails.dart';
import '../Pages/staff/oneloanextended.dart';

class PaymentandDetails {
  List<LoanPayments> loanPayments;
  OneLoanDetails oneLoanDetails;

  PaymentandDetails({required this.loanPayments, required this.oneLoanDetails});
}

class ViewOneLoan extends StatefulWidget {
  final String loanNumber;
  const ViewOneLoan({super.key, required this.loanNumber});

  @override
  State<ViewOneLoan> createState() => _ViewOneLoanState();
}

class _ViewOneLoanState extends State<ViewOneLoan> {

  late String loanNumber;

  Future<PaymentandDetails> fetchPaymentAndDetails(String loanNumber) async {
    OneLoanDetails oneLoanDetails = await fetchOneLoanDetailsData(loanNumber);
    List<LoanPayments> loanPayments = await fetchListPaymentValues(oneLoanDetails.loanId);
    return PaymentandDetails(loanPayments: loanPayments, oneLoanDetails: oneLoanDetails);
  }

  @override
  void initState() {
    super.initState();
    loanNumber = widget.loanNumber;
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fetchPaymentAndDetails(loanNumber),
      builder: (context , snapshot){
        if (snapshot.hasData) {
          PaymentandDetails paymentandDetails = snapshot.data!;
          return OneLoanExtended(oneLoanDetails: paymentandDetails.oneLoanDetails, loanPayments: paymentandDetails.loanPayments,);
        } else if (snapshot.hasError){
          return Text("Error : ${snapshot.error}");
      } else {
        return const CircularProgressIndicator();
      }
      }
      );
  }
}