import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loan_managment_app/Apis/logincontroller.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  LogInController logInController = Get.put(LogInController());
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      resizeToAvoidBottomInset: false,
      body:  Padding(
        padding: const EdgeInsets.only(top: 100, left: 40, right: 40),
        child: Column(
          children: [
             TextField(
              controller: logInController.usernameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Username'
              ),
            ),
             TextField(
              controller: logInController.passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Password'
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (kDebugMode) {
                  print("clicked");
                }
                logInController.logInWithUsername();
                },
              child: const Text('Login'),
            ),
          ],
        ),
      ),
      
    );
  }
}
