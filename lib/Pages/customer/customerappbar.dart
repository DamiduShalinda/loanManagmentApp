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
      leadingWidth: 100,
      elevation: 0,
      titleTextStyle: TextStyle(
          color: Theme.of(context).colorScheme.secondary, fontSize: 18, fontWeight: FontWeight.w200),
      backgroundColor: Colors.transparent,
      title: const Text("Hasaru Enterprices"),
      actions: [
        IconButton(
          onPressed: () async {
            final SharedPreferences prefs = await _prefs;
            prefs.clear();
            Get.offAll(() => const Login());
          },
          icon: const Icon(Icons.logout),
          color: Theme.of(context).colorScheme.secondary,
        ),
        const SizedBox(
          width: 10,
        )
      ],
      
    );
  }
    Widget _profileImage(int size) => CircleAvatar(
      
        backgroundImage: const NetworkImage(
            'https://cdn.pixabay.com/photo/2023/06/12/05/12/bird-8057638_1280.jpg'),
        radius: size.toDouble(),
      );
  
}
