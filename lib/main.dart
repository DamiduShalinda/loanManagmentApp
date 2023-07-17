import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'Pages/staff/login.dart';

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
          secondary: const Color.fromARGB(255, 32, 101, 30),
        )
      ),
      
      debugShowCheckedModeBanner: false,
        
      home: const SafeArea(
        child: Scaffold(
        resizeToAvoidBottomInset: false,
          body: Login(),
      ),)
    );
  }
}


