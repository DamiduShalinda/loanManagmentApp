import 'package:flutter/material.dart';
import 'package:loan_managment_app/Widgets/listPayments.dart';
import '../../modals/loanpaymentsmodal.dart';

class DetailsCustomer extends StatefulWidget {
  const DetailsCustomer({super.key});

  @override
  State<DetailsCustomer> createState() => _DetailsCustomerState();
}

class _DetailsCustomerState extends State<DetailsCustomer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: PaymentListView(paymentlist: generateMockData()),
      ),
    );
  }
}


List<LoanPayments> generateMockData() {
  List<LoanPayments> mockData = [];

  // Create mock LoanPayments objects
  LoanPayments payment1 = LoanPayments(
    loanId: "1",
    username: "johnsmith",
    paymentDate: "2023-06-15",
    paymentAmount: 500.0,
    principal: 400.0,
    interest: 100.0,
    balance: 1000.0,
  );
  mockData.add(payment1);

  LoanPayments payment2 = LoanPayments(
    loanId: "2",
    username: "janedoe",
    paymentDate: "2023-06-20",
    paymentAmount: 800.0,
    principal: 600.0,
    interest: 200.0,
    balance: 5000.0,
  );
  mockData.add(payment2);

  LoanPayments payment3 = LoanPayments(
    loanId: "3",
    username: "janedoe",
    paymentDate: "2023-06-20",
    paymentAmount: 800.0,
    principal: 600.0,
    interest: 200.0,
    balance: 5000.0,
  );
  mockData.add(payment3);

  // Add more mock LoanPayments objects as needed...

  return mockData;
}