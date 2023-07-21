import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loan_managment_app/Apis/getstaffidcontroller.dart';
import 'package:loan_managment_app/Pages/staff/search.dart';
import 'package:loan_managment_app/Pages/staff/viewarrears.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Widgets/viewallcustomers.dart';
import 'home.dart';
import 'login.dart';

class NavPage extends StatefulWidget {
  final int id;
  const NavPage({super.key, required this.id});


  @override
  State<NavPage> createState() => _NavPageState();
}

class _NavPageState extends State<NavPage> {

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  int _selectedIndex = 0;
  late int id;

  @override
  void initState() {
    super.initState();
    id = widget.id;
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fetchStaffNameData(id),
      builder: (context , snapshot) {
        if (snapshot.hasData) {
          StaffName staffName = snapshot.data!;
          return Scaffold(
      appBar: AppBar(
        title: Text("Hello ${staffName.name} !!" ),
        actions: [
          IconButton(
              onPressed: () {}, 
              icon: const Icon(Icons.light_mode_outlined)),
          const SizedBox(width: 10,),
          IconButton(
            onPressed: () async {
              final SharedPreferences prefs = await _prefs;
              prefs.clear();
              Get.offAll(() => const Login());
            },
            icon: const Icon(Icons.logout_outlined),
            ),
        ],
      ),
      body: Center(
        child: <Widget>[
          const HomeScreen(), 
          ViewArrears(staffName: staffName,),
          const Search(),
          const ViewAllCustomers(),
            ].elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              rippleColor: Colors.grey[300]!,
              hoverColor: Colors.grey[100]!,
              gap: 8,
              activeColor: Colors.black,
              iconSize: 24,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: const Duration(milliseconds: 400),
              tabBackgroundColor: Colors.grey[100]!,
              color: Colors.black,
              tabs: const [
                GButton(
                  icon: Icons.home,
                  text: 'Home',
                ),
                GButton(
                  icon: Icons.payment,
                  text: 'Arrears',
                ),
                GButton(
                  icon: Icons.description,
                  text: 'All Loans',
                ),
                GButton(
                  icon: Icons.group,
                  text: 'All Customers',
                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      }
      );
  }
}