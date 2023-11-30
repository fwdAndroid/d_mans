import 'package:d_mans/responsive/responsive_layout.dart';
import 'package:d_mans/screens/auth/login_screen.dart';
import 'package:d_mans/screens/onboardingscreens/components/onboard_content.dart';
import 'package:d_mans/utils/colors.dart';
import 'package:d_mans/web_module/web_screen_login.dart';
import 'package:flutter/material.dart';

class OnBoardScreen extends StatefulWidget {
  const OnBoardScreen({super.key});

  @override
  State<OnBoardScreen> createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {
  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {"text": "Welcome to D'mans, Let’s shop!", "image": "assets/splash_1.png"},
    {
      "text": "We help people conect with store \naround Malaysia",
      "image": "assets/splash_2.png"
    },
    {
      "text": "We show the easy way to shop. \nJust stay at home with us",
      "image": "assets/splash_3.png"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 3,
                child: PageView.builder(
                  onPageChanged: (value) {
                    setState(() {
                      currentPage = value;
                    });
                  },
                  itemCount: splashData.length,
                  itemBuilder: (context, index) => OnBoardContent(
                    image: splashData[index]["image"],
                    text: splashData[index]['text'],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: <Widget>[
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          splashData.length,
                          (index) => AnimatedContainer(
                            duration: kAnimationDuration,
                            margin: const EdgeInsets.only(right: 5),
                            height: 6,
                            width: currentPage == index ? 20 : 6,
                            decoration: BoxDecoration(
                              color: currentPage == index
                                  ? mainColor
                                  : const Color(0xFFD8D8D8),
                              borderRadius: BorderRadius.circular(3),
                            ),
                          ),
                        ),
                      ),
                      const Spacer(flex: 3),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            fixedSize: Size(300, 0),
                            backgroundColor: mainColor),
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (builder) => ResponsiveLayout(
                                      mobileScreenLayout: LoginScreen(),
                                      webScreenLayout: WebScreenLogin())));
                        },
                        child: Text(
                          "Continue",
                          style: TextStyle(color: colorwhite),
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
