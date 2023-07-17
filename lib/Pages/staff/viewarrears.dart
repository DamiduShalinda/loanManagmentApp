import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:loan_managment_app/utils/usersecurestorage.dart';

import 'login.dart';

class ViewArrears extends StatelessWidget {
  const ViewArrears({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      body: Text("View Arrears"),
    );
  }

  void onPressed() {
    UserSecureStorage.deleteTokens();
    Get.offAll(() => const Login());
    }
}