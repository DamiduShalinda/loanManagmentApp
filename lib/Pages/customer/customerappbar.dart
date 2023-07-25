import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../staff/login.dart';

class CustomerAppBar extends StatelessWidget implements PreferredSizeWidget {
  CustomerAppBar({Key? key}) : super(key: key);

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

   @override
  Size get preferredSize =>const Size.fromHeight(70);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 2,
      toolbarTextStyle: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      backgroundColor: Theme.of(context).colorScheme.secondary,
      title: Container(
        alignment: Alignment.centerLeft,
        child: ListTile(
          onTap: () {},
          contentPadding: const EdgeInsets.fromLTRB(10, 20, 0, 7),
          leading: SvgPicture.asset(
              'assets/logo.svg',
              color: Theme.of(context).colorScheme.primary,
              width: 55,
              height: 55,
            ),
          title: const Text(
            "Hasaru Enterprises",
            style: TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.w600,
            ),
          ),
          trailing: IconButton(
          onPressed: () async {
            final SharedPreferences prefs = await _prefs;
            prefs.clear();
            Get.offAll(() => const Login());
          },
          icon: Icon(
            Icons.logout,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
          ),
      ),
      
    );
  }
    Widget _profileImage(int size) => CircleAvatar(
      
        backgroundImage: const NetworkImage(
            'https://cdn.pixabay.com/photo/2023/06/12/05/12/bird-8057638_1280.jpg'),
        radius: size.toDouble(),
      );
  
}
