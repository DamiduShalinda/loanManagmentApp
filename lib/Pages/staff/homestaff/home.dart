import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:loan_managment_app/Apis/getstaffhome.dart';

class HomeScreen extends StatefulWidget {
  final GetStaffHomeData staffHomeData;
  const HomeScreen({Key? key, required this.staffHomeData}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  late GetStaffHomeData staffHomeData;
  late List<LoanArrears> loanarreaslist;
  late List<LoanArrearsToday> loanarreaslisttoday;

  @override
  void initState() {
    super.initState();
    staffHomeData = widget.staffHomeData;
    loanarreaslist = staffHomeData.loanArrears!;
    loanarreaslisttoday = staffHomeData.loanArrearsToday!;
  }
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        children: [
          Text(
            "Welcome Back ,  ${staffHomeData.staffName} !!",
            style: TextStyle(
                fontSize: 28,
                height: 2.5,
                letterSpacing: 3,
                fontWeight: FontWeight.w500,
                color: Theme.of(context).colorScheme.primary),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50.0),
            child: Divider(
              color: Theme.of(context).colorScheme.primary,
              thickness: 1,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0 , vertical: 7),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.17,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.group_outlined,
                        color: Theme.of(context).colorScheme.primary,
                        size: 30,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "${staffHomeData.arrearsCount} Accounts",
                        style: TextStyle(
                            fontSize: 18,
                            height: 2,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.primary),
                      ),
                      Text(
                        "Arrears Accounts",
                        style: TextStyle(
                            fontSize: 14,
                            height: 2,
                            fontWeight: FontWeight.w300,
                            color: Theme.of(context).colorScheme.primary),
                      ),
                    ],
                  ),
                  const VerticalDivider(
                    color: Colors.black,
                    thickness: 1,
                    endIndent: 15,
                  ),
                  InkWell(
                    onTap: () {if (kDebugMode) {
                      print("tapped");
                    }},
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.add_circle_rounded,
                          color: Theme.of(context).colorScheme.primary,
                          size: 40,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        ActionChip(
                          labelPadding: const EdgeInsets.symmetric(horizontal: 10),
                          onPressed: () {},
                          label: Text(
                            "Add a Payment",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Theme.of(context).colorScheme.primary),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          loanarreaslist.isEmpty ? 
          const Text("No Arrears Accounts" , style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w300,
            color: Colors.red
          ),) : 
          Container(
          margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
          height: MediaQuery.of(context).size.height * 0.222,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.all(8),
              scrollDirection: Axis.horizontal,
              itemCount: loanarreaslist.length + 1,
              itemBuilder: (context, index) {
                if (index == loanarreaslist.length) {
                  return Container(
                    width: 50.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Theme.of(context).colorScheme.primary,
                    ), 
                    child: Icon(Icons.arrow_forward, color : Theme.of(context).colorScheme.secondary),
                  );
                } else {
                  return Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Container(
                      width: 230.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _textlabel(Icons.credit_score, loanarreaslist[index].loanNumber!, Theme.of(context).colorScheme.secondary),
                            _textlabel(Icons.account_circle, loanarreaslist[index].customerName!, Theme.of(context).colorScheme.secondary),
                            _textlabel(Icons.money, "LKR ${loanarreaslist[index].loanArrearsAmount!.toStringAsFixed(2)}", Theme.of(context).colorScheme.secondary),
                          ],
                        ),
                      ),
                    ),
                  );
                }
              },
            ),
          ),
        ),

          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
               SizedBox(
                width: MediaQuery.of(context).size.width * 0.05,
              ),
              Text(
                "Arrears Accounts Due Today - ${staffHomeData.currentDate}",
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.045,
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).colorScheme.primary),
              ),
            ],
          ),
          Container(
          margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
          height: MediaQuery.of(context).size.height * 0.175,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.all(8),
              scrollDirection: Axis.horizontal,
              itemCount: loanarreaslisttoday.length + 1,
              itemBuilder: (context, index) {
                if (index == loanarreaslisttoday.length) {
                  return Container(
                    width: 50,
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Theme.of(context).colorScheme.secondary,
                    ), 
                    child: Icon(Icons.arrow_forward, color : Theme.of(context).colorScheme.primary),
                  );
                } else {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 3 , vertical: 7),
                    child: Card(
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.35,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(Icons.money_off , size: 35,),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.01,
                            ),
                            Text(
                              loanarreaslisttoday[index].loanNumber!,
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  color: Theme.of(context).colorScheme.primary),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.0093,
                            ),
                            Text(
                              "LKR  ${loanarreaslisttoday[index].loanArrearsAmount!.toStringAsFixed(2)}",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w300,
                                  color: Theme.of(context).colorScheme.primary),
                            ),	
                          ],
                        ),
                  
                      ),
                    ),
                  );
                }
              },
            ),
          ),
        ),

        ]
      )
    );    
  }

  Widget _textlabel(IconData icon , String text , Color color) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10 , vertical: 7),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: color,
          size: 20,
        ),
        const SizedBox(
          width: 12,
        ),
        Text(
          text,
          style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w300,
              color: color),
        ),
      ],
    ),
  );
}

class CardData {
  final String label1;
  final String label2;
  final String label3;

  CardData(this.label1, this.label2, this.label3);
}

List<CardData> cardDataArray = [
  CardData("2019-001-71", "Damidu Shalinda", "Arrears - Lkr 145000"),
  CardData("2019-002-71", "Kumara Shalinda", "Arrears - Lkr 125000"),
  CardData("2019-001-61", "SHalinda", "Arrears - Lkr 80000"),
];

class OtheList {
  final String loanedNumber;
  final String arrearsAmount;

  OtheList(this.loanedNumber, this.arrearsAmount);
}

List<OtheList> otherListArray = [
  OtheList("2019-001-71", "145000"),
  OtheList("2019-002-71", "125000"),
  OtheList("2019-001-61", "80000"),
];

List<String> yourOtherList = [
  "Item 1",
  "Item 2",
  "Item 3",
  "Item 4",
  "Item 5",
  // Add more items as needed
];
