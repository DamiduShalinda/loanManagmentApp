
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xff16171d),
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xff16171d),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
        title: const Text(
          "Log In",
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
            fontSize: 20,
            color: Color(0xffffffff),
          ),
        ),
        leading: const Icon(
          Icons.arrow_back,
          color: Color(0xffffffff),
          size: 20,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
              child: Container(
                height: MediaQuery.of(context).size.width * 0.3,
                width: MediaQuery.of(context).size.width * 0.3,
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Image.network(
                  "https://scontent-sin6-2.xx.fbcdn.net/v/t39.30808-6/301114753_454953463313756_553551324719470131_n.jpg?_nc_cat=108&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=_0kfwfoD2yAAX-8mejX&_nc_ht=scontent-sin6-2.xx&oh=00_AfB1LJY8moPdB7nGTdfWmEG3rZhOLvgoZW7JdaiuZsBJ9w&oe=646700A2",
                  fit: BoxFit.contain),
            ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
              child: Text(
                "Email Address",
                textAlign: TextAlign.start,
                overflow: TextOverflow.clip,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                  fontSize: 16,
                  color: Color(0xffa7aebf),
                ),
              ),
            ),
            TextField(
              controller: TextEditingController(),
              obscureText: false,
              textAlign: TextAlign.start,
              maxLines: 1,
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
                fontSize: 20,
                color: Color(0xffffffff),
              ),
              decoration: InputDecoration(
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: const BorderSide(color: Color(0x00000000), width: 1),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: const BorderSide(color: Color(0x00000000), width: 1),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: const BorderSide(color: Color(0x00000000), width: 1),
                ),
                hintText: "Enter your email address",
                hintStyle: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                  fontSize: 16,
                  color: Color(0xff494d58),
                ),
                filled: true,
                fillColor: const Color(0xff21242d),
                isDense: false,
                contentPadding:
                const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              ),
            ),
            const SizedBox(
              height: 16,
              width: 16,
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
              child: Text(
                "Password",
                textAlign: TextAlign.start,
                overflow: TextOverflow.clip,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                  fontSize: 16,
                  color: Color(0xffa7aebf),
                ),
              ),
            ),
            TextField(
              controller: TextEditingController(),
              obscureText: true,
              textAlign: TextAlign.start,
              maxLines: 1,
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
                fontSize: 20,
                color: Color(0xfff7f7f7),
              ),
              decoration: InputDecoration(
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: const BorderSide(color: Color(0xff21242d), width: 1),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: const BorderSide(color: Color(0xff21242d), width: 1),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: const BorderSide(color: Color(0xff21242d), width: 1),
                ),
                hintText: "Enter your password",
                hintStyle: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                  fontSize: 16,
                  color: Color(0xff494d58),
                ),
                filled: true,
                fillColor: const Color(0xff21242d),
                isDense: false,
                contentPadding:
                const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                suffixIcon: const Icon(Icons.visibility_off,
                    color: Color(0xff494d58), size: 20),
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 7, 0, 0),
              child: Text(
                "Forgot Password?",
                textAlign: TextAlign.start,
                overflow: TextOverflow.clip,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                  fontSize: 15,
                  color: Color(0xfff5c249),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
              width: 16,
            ),
            MaterialButton(
              onPressed: () {},
              color: const Color(0xfff5c249),
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
                side: const BorderSide(color: Color(0xff808080), width: 1),
              ),
              padding: const EdgeInsets.all(16),
              textColor: const Color(0xff000000),
              height: 40,
              minWidth: 140,
              child: const Text(
                "Log In",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                ),
              ),
            ),
            const Expanded(
              flex: 1,
              child: SizedBox(
                height: 16,
                width: 16,
              ),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                  child: Text(
                    "New to Hasaru?",
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.clip,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontSize: 10,
                      color: Color(0xff494d58),
                    ),
                  ),
                ),
                Text(
                  "Request an account",
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.clip,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    fontSize: 11,
                    color: Color(0xfff5c249),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
