import 'dart:typed_data';

import 'package:d_mans/screens/auth/login_screen.dart';
import 'package:d_mans/services/database_methods.dart';
import 'package:d_mans/utils/colors.dart';
import 'package:d_mans/utils/image.dart';
import 'package:d_mans/utils/textorminputfields.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController phoneControoler = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  Uint8List? _image;

  //Looding Variable
  bool _isLoading = false;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.clear();
    passController.clear();
    phoneControoler.clear();
    userNameController.clear();
  }

  bool passwordVisible = false;

  @override
  void initState() {
    super.initState();
    passwordVisible = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                _image != null
                    ? CircleAvatar(
                        radius: 59, backgroundImage: MemoryImage(_image!))
                    : CircleAvatar(
                        radius: 59,
                        backgroundImage: NetworkImage(
                            'https://static.remove.bg/remove-bg-web/a6eefcd21dff1bbc2448264c32f7b48d7380cb17/assets/start_remove-c851bdf8d3127a24e2d137a55b1b427378cd17385b01aec6e59d5d4b5f39d2ec.png'),
                      ),
                Positioned(
                    bottom: -10,
                    left: 70,
                    child: IconButton(
                        onPressed: () => selectImage(),
                        icon: Icon(
                          Icons.add_a_photo,
                          color: Colors.black,
                        )))
              ],
            ),
            SizedBox(
              height: 23,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormInputField(
                hintText: 'Enter your username',
                textInputType: TextInputType.text,
                controller: userNameController,
                suIcon: Icon(
                  Icons.person,
                  color: colorBlack,
                ),
              ),
            ),
            SizedBox(
              height: 23,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormInputField(
                suIcon: Icon(
                  Icons.email,
                  color: colorBlack,
                ),
                hintText: 'Enter your email',
                textInputType: TextInputType.emailAddress,
                controller: emailController,
              ),
            ),
            SizedBox(
              height: 23,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                obscureText: passwordVisible,
                controller: passController,
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
                ),
              ),
            ),
            SizedBox(
              height: 23,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormInputField(
                suIcon: Icon(
                  Icons.phone,
                  color: colorBlack,
                ),
                hintText: 'Enter your Phone Number',
                textInputType: TextInputType.number,
                controller: phoneControoler,
              ),
            ),
            SizedBox(
              height: 23,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: signUpUsers,
                child: _isLoading
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : Container(
                        height: 60,
                        child: Text('Register'),
                        width: double.infinity,
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(horizontal: 22),
                        decoration: ShapeDecoration(
                            color: mainColor,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4)))),
                      ),
              ),
            ),
            SizedBox(
              height: 13,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Text(
                    "Already an account ?",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 9),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (builder) => LoginScreen()));
                  },
                  child: Container(
                    child: Text(
                      "Sign In",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 9),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  ////Functions///////

  /// Select Image From Gallery
  selectImage() async {
    Uint8List ui = await pickImage(ImageSource.gallery);
    setState(() {
      _image = ui;
    });
  }

  ///Register Users
  signUpUsers() async {
    if (userNameController.text.isEmpty ||
        emailController.text.isEmpty ||
        passController.text.isEmpty ||
        phoneControoler.text.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("All Fields are required")));
    } else {
      setState(() {
        _isLoading = true;
      });
      String rse = await DatabaseMethods().signUpUser(
          email: emailController.text,
          pass: passController.text,
          bio: phoneControoler.text,
          username: userNameController.text,
          file: _image!);

      print(rse);
      setState(() {
        _isLoading = false;
      });
      if (rse != 'sucess') {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Error")));
      } else {
        Navigator.push(
            context, MaterialPageRoute(builder: (builder) => LoginScreen()));
      }
    }
  }
}
