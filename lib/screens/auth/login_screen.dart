import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:d_mans/screens/auth/create_account..dart';
import 'package:d_mans/screens/main_screen.dart';
import 'package:d_mans/services/database_methods.dart';
import 'package:d_mans/utils/colors.dart';
import 'package:d_mans/utils/textorminputfields.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:social_login_buttons/social_login_buttons.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormInputField(
              controller: emailController,
              suIcon: Icon(
                Icons.email,
                color: colorBlack,
              ),
              hintText: 'Email Address',
              textInputType: TextInputType.emailAddress,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: TextFormField(
                obscureText: passwordVisible,
                controller: passwordController,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    icon: Icon(
                      passwordVisible ? Icons.visibility : Icons.visibility_off,
                      color: colorBlack,
                    ),
                    onPressed: () {
                      setState(
                        () {
                          passwordVisible = !passwordVisible;
                        },
                      );
                    },
                  ),
                  hintText: 'Enter your password',
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
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
                                builder: (builder) => MainScreen()))
                      });
            },
            child: Text(
              "Login",
              style: TextStyle(color: colorwhite),
            ),
            style: ElevatedButton.styleFrom(
                backgroundColor: mainColor, fixedSize: Size(300, 50)),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Divider(
              color: colorBlack,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SocialLoginButton(
              backgroundColor: mainColor,
              textColor: colorwhite,
              width: 300,
              borderRadius: 20,
              buttonType: SocialLoginButtonType.google,
              onPressed: () async {
                setState(() {
                  _isloading = true;
                });
                await DatabaseMethods().signInWithGoogle().then((value) async {
                  await FirebaseFirestore.instance
                      .collection("users")
                      .doc(FirebaseAuth.instance.currentUser!.uid)
                      .set({
                    "photoURL":
                        FirebaseAuth.instance.currentUser!.photoURL.toString(),
                    "email": FirebaseAuth.instance.currentUser!.email,
                    "name": FirebaseAuth.instance.currentUser!.displayName,
                    "phoneNumber": FirebaseAuth
                        .instance.currentUser!.phoneNumber
                        .toString(),
                    "uid": FirebaseAuth.instance.currentUser!.uid
                  });
                });
                setState(() {
                  _isloading = false;
                });
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (builder) => MainScreen()));
              },
            ),
          ),
          TextButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (builder) => SignUp()));
              },
              child: Text("Create Account"))
        ],
      ),
    );
  }
}
