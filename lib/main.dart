import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:loan_managment_app/AuthChecker.dart';
import 'package:hexcolor/hexcolor.dart';

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
          primary: HexColor('#1E2022'),
          secondary: Colors.grey[100],
          tertiary:  HexColor('#C9D6DF'),
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


