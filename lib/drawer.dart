import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Pages/listloans.dart';

class SimpleDrawer extends StatelessWidget {
  const SimpleDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
              width: MediaQuery.of(context).size.width * 0.6,
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  const DrawerHeader(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                    ),
                    child: Text('Hasaru Enterprices' , 
                    style: TextStyle(color: Colors.white, fontSize: 24)),
                  ),
                  ListTile(
                    title: const Text('Item 1'),
                    onTap: () {
                      Navigator.pop(context ,);
                    },
                  ),
                  ListTile(
                    title: const Text('List All Loans'),
                    hoverColor: Colors.blue,
                    onTap: () {
                      Get.to(const ListLoans());
                    },
                  ),
                ],
              ),
            );
  }
}