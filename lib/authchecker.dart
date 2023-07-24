import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Pages/customer/homescreencustomer.dart';
import 'Pages/staff/login.dart';
import 'Pages/staff/nav.dart';

class AuthChecker extends StatelessWidget {
  const AuthChecker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _checkUserType(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          DecodedToken decodedToken = snapshot.data!;
          int id = (decodedToken.userid!);
          if (decodedToken.usertype == 'customer') {
            return  HomescreenCustomer(id: id);
          } else if (decodedToken.usertype == 'staff') {
            return NavPage(id: id);
          } else {
            return const Login();
          }
        } else if (snapshot.hasError) {
          if (kDebugMode) {
            print(snapshot.error);
          }
          return const Login();
        }
        else {
          return const Login();
        }
      },
    );
  }

  Future<DecodedToken?> _checkUserType() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? accessToken = prefs.getString('access');
    if (accessToken != null) {
      Map<String, dynamic> decodedToken = JwtDecoder.decode(accessToken);
      DecodedToken decodedTokenObject = DecodedToken(
          userid: decodedToken['user_id'], usertype: decodedToken['usertype']);
      return decodedTokenObject;
    } else {
      return null;
    }
  }
}

class DecodedToken {

    int? userid;
    String? usertype;

    DecodedToken({this.userid, this.usertype});
}