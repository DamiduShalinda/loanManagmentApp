import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:loan_managment_app/AuthChecker.dart';

void main() {
  runApp
  ( 
     const MyApp()
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return   GetMaterialApp(
      
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color.fromARGB(255, 21, 31, 44),
          secondary: Colors.grey[100],
          tertiary: Colors.yellow,
        )
      ),
      
      debugShowCheckedModeBanner: false,
        
      home: const SafeArea(
        child: Scaffold(
        resizeToAvoidBottomInset: false,
          body: AuthChecker(),
      ),)
    );
  }
}


