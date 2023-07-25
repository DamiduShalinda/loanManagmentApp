import 'package:flutter/material.dart';
import 'package:loan_managment_app/Pages/customer/customerappbar.dart';

class HomescreenCustomer extends StatefulWidget {
  final int id;
  const HomescreenCustomer({Key? key, required this.id}) : super(key: key);

  @override
  State<HomescreenCustomer> createState() => _HomescreenCustomerState();
}

class _HomescreenCustomerState extends State<HomescreenCustomer> {
  late int id;

  @override
  void initState() {
    super.initState();
    id = widget.id;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        appBar: CustomerAppBar(),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(15, 0, 15, 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Card(
                margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                elevation: 1,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    border: Border.all(
                      color: Theme.of(context)
                          .colorScheme
                          .primary, // Choose your border color
                      width: 2.0, // Choose your border width
                    ),
                    borderRadius: BorderRadius.circular(
                        15.0), // Choose your border radius
                  ),
                  child: ListTile(
                    textColor: Theme.of(context).colorScheme.primary,
                    contentPadding: const EdgeInsets.fromLTRB(10, 7, 10, 7),
                    leading: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                       border: Border.all(
                        color: Colors.black, // Set the color of the border
                        width: 2.0, // Set the width of the border
                      ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: _profileImage(40),
                      )
                      
                      ),
                    title: const Text(
                      "Damidu Shalinda",
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    subtitle: const Text(
                      "123 , Main Street, Colombo 01",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    trailing: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 30,
                      ),
                    )
                  ),
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                  side: BorderSide(color: Theme.of(context).colorScheme.primary),
                ),
                child: Container(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                  width: double.infinity,
                  height: 150,
                  child: const Text(
                          "Loan Number",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                ),
              ),
              // Card(
              //   color: Theme.of(context).colorScheme.onPrimaryContainer,
              //   elevation: 5,
              //   shape: RoundedRectangleBorder(
              //     borderRadius: BorderRadius.circular(15),
              //   ),
              //   child: Padding(
              //     padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              //     child: Container(
              //       alignment: Alignment.centerRight,
              //       width: double.infinity,
              //       height: 150,
              //       child: Row(
              //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //         children: [
              //           Column(
              //             mainAxisAlignment: MainAxisAlignment.spaceAround,
              //             crossAxisAlignment: CrossAxisAlignment.center,
              //             children: [
              //               Container(
              //                 padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              //                 margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              //                 child: Text(
              //                   "Damidu Shalinda",
              //                   style: TextStyle(
              //                     fontSize: 25,
              //                     fontWeight: FontWeight.normal,
              //                     color: Theme.of(context).colorScheme.secondary,
              //                     ),
              //                     ),
              //               ),
              //               const SizedBox(
              //                 height: 10,
              //               ),
              //               ActionChip(label: const Text("View Profile"), onPressed: (){}),
              //             ],
              //           ),
              //           Padding(
              //             padding: const EdgeInsets.all(8.0),
              //             child: _profileImage(70),
              //           ),
              //         ],
              //       )
              //     ),
              //   )
              //   ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 3,
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    border: Border.all(
                      color: Theme.of(context)
                          .colorScheme
                          .primary, // Choose your border color
                      width: 2.0, // Choose your border width
                    ),
                    borderRadius: BorderRadius.circular(
                        15.0), // Choose your border radius
                  ),
                  child: TextButton(
                    onPressed: () {},
                    child: Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Proceed To a Payment",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.secondary),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.arrow_forward,
                            size: 23,
                            color: Theme.of(context).colorScheme.secondary,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  Widget _profileImage(int size) => CircleAvatar(
      
        backgroundImage: const NetworkImage(
            'https://cdn.pixabay.com/photo/2023/06/12/05/12/bird-8057638_1280.jpg'),
        radius: size.toDouble(),
        backgroundColor: Theme.of(context).colorScheme.primary,
      );
}
