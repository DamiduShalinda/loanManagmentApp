import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
            body: Center(
            child: Column(
              children: [
                  const Text('Welcome home'),
                  TextButton(
                      onPressed: () async {
                      final SharedPreferences prefs = await _prefs;
                      if (kDebugMode) {
                        print(prefs.get('access'));
                      }
                      },
                     child: const Text('print token'))
                ],
            ),
            ),
    );

  }
}
