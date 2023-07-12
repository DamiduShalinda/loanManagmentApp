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
  final String assetName = 'assets/logo.svg';
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: const Color.fromARGB(255, 21, 31, 44)	,
      resizeToAvoidBottomInset: false,
      body:  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // SvgPicture.asset(
          //   assetName,
          //   colorFilter: const ColorFilter.mode(Colors.yellow, BlendMode.srcIn),
          //   semanticsLabel: 'A red up arrow',
          //   width: 150,
          //   height: 150,
          //   ),
          // SizedBox(
          //   height: MediaQuery.of(context).size.height * 0.05,
          // ),
          
           Padding(
             padding: const EdgeInsets.symmetric(vertical: 20.0 , horizontal: 30.0),
             child: Theme(
                data: ThemeData(
                  inputDecorationTheme: const InputDecorationTheme(
                    labelStyle: TextStyle(color: Colors.white),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)
                    ),
                    
                  )
                ),
               child: TextField(
                controller: logInController.usernameController,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Username'
                ),
                         ),
             ),
           ),
           Padding(
             padding: const EdgeInsets.symmetric(vertical: 20.0 , horizontal: 30.0),
             child: Theme(
                data: ThemeData(
                  inputDecorationTheme: const InputDecorationTheme(
                    labelStyle: TextStyle(color: Colors.white),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)
                    )
                  )
                ),
               child: TextField(
                controller: logInController.passwordController,
                style: const TextStyle(color: Colors.white),
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password'
                ),
                         ),
             ),
           ),
          Padding(
             padding: const EdgeInsets.symmetric(vertical: 20.0 , horizontal: 30.0),
            child: SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.07,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  
                  backgroundColor: Colors.yellow,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  padding: const EdgeInsets.symmetric(
                      vertical: 12.0, horizontal: 32.0),
                ),
                onPressed: () {
                  logInController.logInWithUsername();
                  _submitForm();
                  },
                child: const Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 15,
                    color: Color(0xff15202b),
                    fontWeight: FontWeight.w900,
                  ),
                  ),
              ),
            ),
          ),
        ],
      ),
      
    );
  }
  void _submitForm() {
    
      // Perform form submission logic here

      // Do something with the form data

      // Reset the form
      _formKey.currentState?.reset();
  }
  
}
