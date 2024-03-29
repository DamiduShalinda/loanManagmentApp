import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
      backgroundColor: Theme.of(context).colorScheme.primary,
      resizeToAvoidBottomInset: false,
      body:  Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 100.0),
            child: Center(
              child: SizedBox(
                width: 150.0,
                height: 150.0,
                child: SvgPicture.asset(assetName , color: Colors.yellow,),
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
                  
                  backgroundColor: Theme.of(context).colorScheme.tertiary,
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
                child:  Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 15,
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.w900,
                  ),
                  ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
          "Contact us at: 1234567890",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.yellow,
            fontSize: 15.0,
          ),
          ),
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
