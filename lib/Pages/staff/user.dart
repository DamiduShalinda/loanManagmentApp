import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:loan_managment_app/utils/usersecurestorage.dart';

import 'login.dart';

class UserAccount extends StatelessWidget {
  const UserAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: ListTile(
        title: TextButton(
          onPressed: onPressed, 
          child: const Text("Logout")),
      )
    );
  }

  void onPressed() {
    UserSecureStorage.deleteTokens();
    Get.offAll(() => const Login());
    }
}