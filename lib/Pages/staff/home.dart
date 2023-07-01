import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:loan_managment_app/utils/usersecurestorage.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
            body: Center(
            child: Column(
              children: [
                  const Text('Welcome home'),
                  TextButton(
                      onPressed: () async {
                      if (kDebugMode) {
                        print(UserSecureStorage.getAcessToken().toString());
                      }
                      },
                     child: const Text('print token'))
                ],
            ),
            ),
    );

  }
}
