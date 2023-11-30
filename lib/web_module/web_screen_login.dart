import 'package:d_mans/screens/main_screen.dart';
import 'package:d_mans/utils/colors.dart';
import 'package:d_mans/utils/textorminputfields.dart';
import 'package:d_mans/web_module/web_screen_signup.dart';
import 'package:d_mans/web_module/web_tabbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class WebScreenLogin extends StatefulWidget {
  const WebScreenLogin({super.key});

  @override
  State<WebScreenLogin> createState() => _WebScreenLoginState();
}

class _WebScreenLoginState extends State<WebScreenLogin> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _isloading = false;
  bool passwordVisible = false;

  @override
  void initState() {
    super.initState();
    passwordVisible = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              "assets/logo.png",
              width: 220,
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 510, right: 510),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormInputField(
                controller: emailController,
                hintText: 'Email Address',
                textInputType: TextInputType.emailAddress,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 50,
              width: 330,
              child: TextFormField(
                obscureText: passwordVisible,
                controller: passwordController,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    icon: Icon(passwordVisible
                        ? Icons.visibility
                        : Icons.visibility_off),
                    onPressed: () {
                      setState(
                        () {
                          passwordVisible = !passwordVisible;
                        },
                      );
                    },
                  ),
                  hintText: 'Enter your password',
                  contentPadding: EdgeInsets.only(top: 5, left: 6),
                ),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              if (emailController.text.isEmpty ||
                  passwordController.text.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Email and Password is Required")));
              }
              await FirebaseAuth.instance
                  .signInWithEmailAndPassword(
                      email: emailController.text,
                      password: passwordController.text)
                  .then((value) => {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (builder) => WebTabBar()))
                      });
            },
            child: Text(
              "NEXT",
              style: TextStyle(color: colorwhite),
            ),
            style: ElevatedButton.styleFrom(
                backgroundColor: mainColor, fixedSize: Size(200, 50)),
          ),
          TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (builder) => WebScreenSignUp()));
              },
              child: Text("Create Account"))
        ],
      ),
    );
  }
}
