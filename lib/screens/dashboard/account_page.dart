import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:d_mans/screens/auth/login_screen.dart';
import 'package:d_mans/screens/dashboard/shop_page.dart';
import 'package:d_mans/utils/colors.dart';
import 'package:d_mans/utils/profile_menu.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "More Settings",
          style: TextStyle(
              color: Colors.grey, fontSize: 40, fontWeight: FontWeight.w400),
        ),
      ),
      body: SafeArea(
        child: StreamBuilder<Object>(
            stream: FirebaseFirestore.instance
                .collection("users")
                .doc(FirebaseAuth.instance.currentUser!.uid)
                .snapshots(),
            builder: (context, AsyncSnapshot snapshot) {
              if (!snapshot.hasData) {
                return new CircularProgressIndicator();
              }
              var document = snapshot.data;
              return Column(
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(
                        document['photoURL'],
                      ),
                    ),
                    title: Text(
                      document['name'],
                      style: TextStyle(
                          color: colorBlack,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      document['email'],
                      style: TextStyle(
                          color: colorBlack,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Divider(
                    color: colorBlack.withOpacity(.1),
                  ),
                  ProfileMenu(
                    text: "Orders",
                    press: () => {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const ShopPage(),
                        ),
                      ),
                    },
                  ),
                  ProfileMenu(
                    text: "Log Out",
                    press: () async {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return Dialog(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      20.0)), //this right here
                              child: Container(
                                height: 300,
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        "assets/logo.png",
                                        height: 80,
                                        width: 80,
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                        'Oh No, Your are leaving',
                                        style: TextStyle(
                                          color: colorBlack,
                                          fontSize: 22,
                                          fontFamily: 'Work Sans',
                                          fontWeight: FontWeight.w500,
                                          height: 0,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      SizedBox(
                                        width: 287,
                                        child: Text(
                                          'Are you sure you want to logout',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: filledColor,
                                            fontSize: 14,
                                            fontFamily: 'Work Sans',
                                            fontWeight: FontWeight.w500,
                                            height: 0.10,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              Navigator.pop(context);
                                            },
                                            child: Container(
                                              width: 100,
                                              height: 51,
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 10,
                                                      vertical: 16),
                                              decoration: ShapeDecoration(
                                                color: Colors.white,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                ),
                                              ),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'No',
                                                    style: TextStyle(
                                                      color: colorBlack,
                                                      fontSize: 16,
                                                      fontFamily: 'Work Sans',
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      height: 0,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 20,
                                          ),
                                          InkWell(
                                            onTap: () async {
                                              await FirebaseAuth.instance
                                                  .signOut()
                                                  .then((value) => {
                                                        Navigator.pushReplacement(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder:
                                                                    (builder) =>
                                                                        LoginScreen()))
                                                      });
                                            },
                                            child: Container(
                                              width: 100,
                                              height: 51,
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 10,
                                                      vertical: 16),
                                              decoration: ShapeDecoration(
                                                color: Color(0xFF40B59F),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                ),
                                              ),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Yes',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 16,
                                                      fontFamily: 'Work Sans',
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      height: 0,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          });
                    },
                  )
                ],
              );
            }),
      ),
    );
  }
}
