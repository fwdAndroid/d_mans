import 'package:d_mans/utils/colors.dart';
import 'package:flutter/material.dart';

class WebCategoryPage extends StatefulWidget {
  const WebCategoryPage({super.key});

  @override
  State<WebCategoryPage> createState() => _WebCategoryPageState();
}

class _WebCategoryPageState extends State<WebCategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: mainColor, borderRadius: BorderRadius.circular(20)),
                child: ExpansionTile(
                    trailing: Icon(
                      Icons.arrow_drop_down,
                      color: colorwhite,
                      size: 40,
                    ),
                    shape: CircleBorder(),
                    tilePadding: EdgeInsets.zero,
                    childrenPadding: const EdgeInsets.all(0.0),
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(
                          alignment: AlignmentDirectional.topStart,
                          child: Text("CHOP",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  color: colorwhite,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(
                          alignment: AlignmentDirectional.topStart,
                          child: Text("WING",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  color: colorwhite,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(
                          alignment: AlignmentDirectional.topStart,
                          child: Text("DRUMSTICK",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  color: colorwhite,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(
                          alignment: AlignmentDirectional.topStart,
                          child: Text("FEET",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  color: colorwhite,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(
                          alignment: AlignmentDirectional.topStart,
                          child: Text("LIVER",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  color: colorwhite,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400)),
                        ),
                      )
                    ],
                    title: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Chicken",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 32,
                              fontWeight: FontWeight.w400)),
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: mainColor, borderRadius: BorderRadius.circular(20)),
                child: ExpansionTile(
                    trailing: Icon(
                      Icons.arrow_drop_down,
                      color: colorwhite,
                      size: 40,
                    ),
                    shape: CircleBorder(),
                    tilePadding: EdgeInsets.zero,
                    childrenPadding: const EdgeInsets.all(0.0),
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(
                          alignment: AlignmentDirectional.topStart,
                          child: Text("CHOP",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  color: colorwhite,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(
                          alignment: AlignmentDirectional.topStart,
                          child: Text("WING",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  color: colorwhite,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(
                          alignment: AlignmentDirectional.topStart,
                          child: Text("DRUMSTICK",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  color: colorwhite,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(
                          alignment: AlignmentDirectional.topStart,
                          child: Text("FEET",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  color: colorwhite,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(
                          alignment: AlignmentDirectional.topStart,
                          child: Text("LIVER",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  color: colorwhite,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400)),
                        ),
                      )
                    ],
                    title: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("DUCK",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 32,
                              fontWeight: FontWeight.w400)),
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: mainColor, borderRadius: BorderRadius.circular(20)),
                child: ExpansionTile(
                    trailing: Icon(
                      Icons.arrow_drop_down,
                      color: colorwhite,
                      size: 40,
                    ),
                    shape: CircleBorder(),
                    tilePadding: EdgeInsets.zero,
                    childrenPadding: const EdgeInsets.all(0.0),
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(
                          alignment: AlignmentDirectional.topStart,
                          child: Text("CHOP",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  color: colorwhite,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(
                          alignment: AlignmentDirectional.topStart,
                          child: Text("WING",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  color: colorwhite,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(
                          alignment: AlignmentDirectional.topStart,
                          child: Text("DRUMSTICK",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  color: colorwhite,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(
                          alignment: AlignmentDirectional.topStart,
                          child: Text("FEET",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  color: colorwhite,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(
                          alignment: AlignmentDirectional.topStart,
                          child: Text("LIVER",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  color: colorwhite,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400)),
                        ),
                      )
                    ],
                    title: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("LAMB",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 32,
                              fontWeight: FontWeight.w400)),
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: mainColor, borderRadius: BorderRadius.circular(20)),
                child: ExpansionTile(
                    trailing: Icon(
                      Icons.arrow_drop_down,
                      color: colorwhite,
                      size: 40,
                    ),
                    shape: CircleBorder(),
                    tilePadding: EdgeInsets.zero,
                    childrenPadding: const EdgeInsets.all(0.0),
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(
                          alignment: AlignmentDirectional.topStart,
                          child: Text("CHOP",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  color: colorwhite,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(
                          alignment: AlignmentDirectional.topStart,
                          child: Text("WING",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  color: colorwhite,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(
                          alignment: AlignmentDirectional.topStart,
                          child: Text("DRUMSTICK",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  color: colorwhite,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(
                          alignment: AlignmentDirectional.topStart,
                          child: Text("FEET",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  color: colorwhite,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(
                          alignment: AlignmentDirectional.topStart,
                          child: Text("LIVER",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  color: colorwhite,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400)),
                        ),
                      )
                    ],
                    title: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("BEEF",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 32,
                              fontWeight: FontWeight.w400)),
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: mainColor, borderRadius: BorderRadius.circular(20)),
                child: ExpansionTile(
                    trailing: Icon(
                      Icons.arrow_drop_down,
                      color: colorwhite,
                      size: 40,
                    ),
                    shape: CircleBorder(),
                    tilePadding: EdgeInsets.zero,
                    childrenPadding: const EdgeInsets.all(0.0),
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(
                          alignment: AlignmentDirectional.topStart,
                          child: Text("CHOP",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  color: colorwhite,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(
                          alignment: AlignmentDirectional.topStart,
                          child: Text("WING",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  color: colorwhite,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(
                          alignment: AlignmentDirectional.topStart,
                          child: Text("DRUMSTICK",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  color: colorwhite,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(
                          alignment: AlignmentDirectional.topStart,
                          child: Text("FEET",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  color: colorwhite,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(
                          alignment: AlignmentDirectional.topStart,
                          child: Text("LIVER",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  color: colorwhite,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400)),
                        ),
                      )
                    ],
                    title: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("FRUITS",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 32,
                              fontWeight: FontWeight.w400)),
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: mainColor, borderRadius: BorderRadius.circular(20)),
                child: ExpansionTile(
                    trailing: Icon(
                      Icons.arrow_drop_down,
                      color: colorwhite,
                      size: 40,
                    ),
                    shape: CircleBorder(),
                    tilePadding: EdgeInsets.zero,
                    childrenPadding: const EdgeInsets.all(0.0),
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(
                          alignment: AlignmentDirectional.topStart,
                          child: Text("CHOP",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  color: colorwhite,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(
                          alignment: AlignmentDirectional.topStart,
                          child: Text("WING",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  color: colorwhite,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(
                          alignment: AlignmentDirectional.topStart,
                          child: Text("DRUMSTICK",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  color: colorwhite,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(
                          alignment: AlignmentDirectional.topStart,
                          child: Text("FEET",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  color: colorwhite,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(
                          alignment: AlignmentDirectional.topStart,
                          child: Text("LIVER",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  color: colorwhite,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400)),
                        ),
                      )
                    ],
                    title: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("VEGETABLES",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 32,
                              fontWeight: FontWeight.w400)),
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: mainColor, borderRadius: BorderRadius.circular(20)),
                child: ExpansionTile(
                    trailing: Icon(
                      Icons.arrow_drop_down,
                      color: colorwhite,
                      size: 40,
                    ),
                    shape: CircleBorder(),
                    tilePadding: EdgeInsets.zero,
                    childrenPadding: const EdgeInsets.all(0.0),
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(
                          alignment: AlignmentDirectional.topStart,
                          child: Text("CHOP",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  color: colorwhite,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(
                          alignment: AlignmentDirectional.topStart,
                          child: Text("WING",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  color: colorwhite,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(
                          alignment: AlignmentDirectional.topStart,
                          child: Text("DRUMSTICK",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  color: colorwhite,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(
                          alignment: AlignmentDirectional.topStart,
                          child: Text("FEET",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  color: colorwhite,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(
                          alignment: AlignmentDirectional.topStart,
                          child: Text("LIVER",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  color: colorwhite,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400)),
                        ),
                      )
                    ],
                    title: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("LEGUME",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 32,
                              fontWeight: FontWeight.w400)),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
