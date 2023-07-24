import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

import '../../Apis/getcustomerloancontroller.dart';
import '../../Widgets/viewaloan.dart';

class HomescreenCustomer extends StatefulWidget {
  final int id;
  const HomescreenCustomer({super.key, required this.id});

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
        body: DefaultTabController(
          length: 2,
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                expandedHeight: 150,
                flexibleSpace: FlexibleSpaceBar(
                  title: Text(
                    'Hasaru Enterprices',
                    style: TextStyle(
                        fontSize: 18.0,
                        color: Theme.of(context).colorScheme.tertiary),
                  ),
                ),
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.logout,
                      color: Theme.of(context).colorScheme.tertiary,
                    ),
                  ),
                ],
              ),
              SliverAppBar(
                pinned: true,
                primary: false,
                backgroundColor: Theme.of(context).colorScheme.primary,
                title:  const Align(
                  alignment: AlignmentDirectional.center,
                  child: TabBar(
                    indicatorColor: Colors.redAccent,
                    tabs: [
                      Tab(child: Text('Loan Details'),),
                      Tab(child: Text('Customer Details'),),
                    ]
                )
              ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 500,
                  child: TabBarView(
                    children: [
                      Center(
                        child: Text('Loan Details'),
                      ),
                      Center(
                        child: Text('Customer Details'),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
