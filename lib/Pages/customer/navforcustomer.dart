import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:loan_managment_app/Pages/customer/details.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../staff/login.dart';
import 'homescreencustomer.dart';

class NavPageCustomer extends StatefulWidget {
  const NavPageCustomer({super.key});

  @override
  State<NavPageCustomer> createState() => _NavPageCustomerState();
}

class _NavPageCustomerState extends State<NavPageCustomer> {

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    HomescreenCustomer(), DetailsCustomer()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Loan Management App'),
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            onPressed: () async {
              final SharedPreferences prefs = await _prefs;
              prefs.clear();
              Get.offAll(() => const Login());
            },
            icon: const Icon(Icons.logout),
          ),
         ],
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
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
          child: Container(
            color: Colors.black,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
              child: GNav(
                backgroundColor: Colors.black,
                rippleColor: Colors.grey[300]!,
                hoverColor: Colors.grey[100]!,
                gap: 8,
                activeColor: Colors.white,
                iconSize: 24,
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                duration: const Duration(milliseconds: 400),
                tabBackgroundColor: Colors.grey[800]!,
                color: Colors.white,
                tabs: const [
                  GButton(
                    icon: Icons.home,
                    text: 'Home',
                  ),
                  GButton(
                    icon: Icons.search,
                    text: 'Search',
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
      ),
    );
  }
}