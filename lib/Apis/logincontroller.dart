import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:loan_managment_app/Pages/customer/homeScreen/homescreenfuture.dart';
import 'package:loan_managment_app/Pages/staff/nav.dart';
import 'package:loan_managment_app/api_endpoints.dart';
import 'package:http/http.dart' as http;
import 'package:loan_managment_app/utils/usersecurestorage.dart';
import 'package:shared_preferences/shared_preferences.dart';


class LogInController extends GetxController {
   TextEditingController usernameController = TextEditingController();
   TextEditingController passwordController = TextEditingController();

  Future<void> logInWithUsername() async {
    var headers = {
      'Content-Type': 'application/json'
    };
    try{
      var url = Uri.parse(ApiEndPoints.baseUrl + ApiEndPoints.authEndPoints.loginUsername);
      Map<String, String> body = {
        "username": usernameController.text,
        "password": passwordController.text
      };
      var encodedBody = jsonEncode(body);
      http.Response response = await http.post(url, headers: headers, body: encodedBody);

      if (response.statusCode == 200){
        final jsonResponse = jsonDecode(response.body);
        var accessToken = jsonResponse['access'];
        var refreshToken = jsonResponse['refresh'];
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('access', accessToken);
        await prefs.setString('refresh', refreshToken);
        UserSecureStorage.setAcessToken(accessToken.toString());
        UserSecureStorage.setRefreshToken(refreshToken.toString());
        Map <String , dynamic> decodedToken = JwtDecoder.decode(accessToken);
        await prefs.setString('usertype', decodedToken['usertype']);

        if (decodedToken['usertype'] == 'customer'){
            Get.off(() => HomeScreenFuture(id: decodedToken['user_id']));
        }else if (decodedToken['usertype'] == 'staff'){
            Get.off(() =>  NavPage(id: decodedToken['user_id']));
        }
      }else {
        usernameController.clear();
        passwordController.clear();
        Fluttertoast.showToast(
            msg: "Invalid Credentials",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: const Color.fromARGB(255, 21, 31, 44),
            textColor: Colors.white,
            fontSize: 16.0
        );
      }

    }catch(e){
      if (kDebugMode) {
        print(e);
      }
    }
  }
}