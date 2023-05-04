import 'package:Orea/screens/admin_signIn/admin_signIn.dart';
import 'package:Orea/screens/user_register/user_register.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:Orea/common_utils/common_utils.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:Orea/common_utils/image_paths.dart';
import 'package:Orea/screens/privecy_policy/privecy_policy.dart';
import 'package:readmore/readmore.dart';
import '../contact_us_screen/contact_us_screen.dart';
import '../welcome_screen/welcome_screen.dart';

class SkipUser extends StatefulWidget {
  const SkipUser({super.key});

  @override
  State<SkipUser> createState() => _SkipUser();
}

class _SkipUser extends State<SkipUser> {
  final List<String> images = [
    ImagePath.prop2,
    ImagePath.prop4,
    ImagePath.prop1,
  ];

  int _currentPage = 0;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      key: _scaffoldKey,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(
            Icons.menu,
            color: deepGreer,
          ),
          onPressed: () => _scaffoldKey.currentState!.openDrawer(),
        ),
        title: Row(
          children: [
            BoldText("OREA ", deepGreer, 18),
            BoldText("Real Estate Bidding", deepGreer, 15),
            const Spacer(),
            IconButton(
              icon: const Icon(Icons.notifications, color: deepGreer),
              onPressed: () {
                dialogue(
                    "Please Login or Register to use these app features !!");
              },
            ),
          ],
        ),
        elevation: 1,
        backgroundColor: whiteColor,
      ),
      drawer: Drawer(
        // backgroundColor: Color(0xFFFCF55F),
        child: Container(
          color: deepBlue,
          child: Column(mainAxisSize: MainAxisSize.max, children: <Widget>[
            UserAccountsDrawerHeader(
              decoration: const BoxDecoration(
                color: deepBlue,
              ),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Image.asset(ImagePath.logo),
              ),
              accountName: const Text(
                "User Name",
                style: TextStyle(
                  fontFamily: 'Ubuntu',
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              accountEmail: const Text(
                "useremail@gmail.com",
                style: TextStyle(
                  fontFamily: 'Ubuntu',
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ),
            const Divider(color: whiteColor, thickness: 1),
            const SizedBox(
              height: 20,
            ),
            ListTile(
              leading: const Icon(Icons.home_filled, color: Colors.white),
              title: const Text(
                "Home",
                style: TextStyle(
                  fontFamily: 'Ubuntu',
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const SkipUser()));
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.developer_mode_rounded,
                color: Colors.white,
              ),
              title: const Text(
                "Admin Sign In",
                style: TextStyle(
                  fontFamily: 'Ubuntu',
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              onTap: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const AdminSignIn()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.account_circle, color: Colors.white),
              title: const Text(
                "Create Account",
                style: TextStyle(
                  fontFamily: 'Ubuntu',
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const UserRegister()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout_rounded, color: Colors.white),
              title: const Text(
                "Log Out",
                style: TextStyle(
                  fontFamily: 'Ubuntu',
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const WelcomeScreen()));
              },
            )
          ]),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 30),
            // CAROUSEL SLIDER ----->>>
            CarouselSlider(
              items: images.map((item) => Image.asset(item)).toList(),
              options: CarouselOptions(
                height: 150,
                aspectRatio: 16 / 9,
                viewportFraction: 0.65,
                initialPage: 0,
                enableInfiniteScroll: true,
                autoPlay: true,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentPage = index;
                  });
                },
              ),
            ),
            const SizedBox(height: 10),
            DotsIndicator(
              dotsCount: images.length,
              position: _currentPage.toDouble(),
              decorator: const DotsDecorator(
                activeColor: deepBlue,
                spacing: EdgeInsets.symmetric(horizontal: 4, vertical: 10),
                size: Size.square(7),
                activeSize: Size.square(11.0),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                  height: 30,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(color: deepGreer, boxShadow: [
                    BoxShadow(
                        color: hint,
                        spreadRadius: 1,
                        blurRadius: 2,
                        offset: Offset(0, 2))
                  ]),
                  child: Center(child: BoldText("Quick Links", whiteColor, 15))),
            ),
            const SizedBox(height: 15),
            // QUICK LINK TABS ----->>>
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                userTabs("VIEW LISTINGS", () {
                  dialogue(
                      "Please Login or Register to view all property listings !!");
                }),
                userTabs("ADD PROPERTY", () {
                  dialogue("Please Login or Register to add your property !!");
                }),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                userTabs("PROFILE", () {
                  dialogue(
                      "Please Login or Register to use all these features !!");
                }),
                userTabs("BALANCE", () {
                  dialogue(
                      "Please Login or Register to use all these features !!");
                }),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                userTabs("OUR POLICY", () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const PrivecyScreen()));
                }),
                userTabs("CONTACT US", () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const ContactUsScreen()));
                }),
              ],
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                  height: 30,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(color: deepGreer, boxShadow: [
                    BoxShadow(
                        color: hint,
                        spreadRadius: 1,
                        blurRadius: 2,
                        offset: Offset(0, 2))
                  ]),
                  child: Center(
                      child: BoldText("Interactive Contents", whiteColor, 15))),
            ),
            // INTERACTIVE CONTENTS ------->>>
            const SizedBox(height: 25),
            categories(ImagePath.prop4,
                "The real estate sector accounts for 60–70% of the country’s wealth, or around USD 300–400 billion, according to World Bank estimates."),
            const SizedBox(height: 20),
            Container(
              height: 32,
              width: 231,
              decoration: BoxDecoration(
                  color: const Color(0xffE5E7FF),
                  borderRadius: BorderRadius.circular(5)),
              child: Center(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(
                    ImagePath.verify,
                    height: 16,
                  ),
                  BoldText("Login to use all functionalities of OREA",
                      const Color(0xff4852D4), 10),
                ],
              )),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  dialogue(String text) {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (ctx) => AlertDialog(
        title: BoldText("Unauthorized User", Colors.red, 18),
        content: BoldText(text, deepGreer, 14),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();
            },
            child: Container(
              color: deepBlue,
              padding: const EdgeInsets.all(10),
              child: BoldText("Go Back", whiteColor, 13),
            ),
          ),
        ],
      ),
    );
  }
}

//Clickable Tabs ---------->>>
userTabs(txt, clk) {
  return InkWell(
    onTap: clk,
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 63,
        width: 150,
        decoration: BoxDecoration(
            color: whiteColor,
            // boxShadow: [
            //   BoxShadow(
            //     color: Colors.blueAccent.shade100,
            //     blurRadius: 5,
            //     spreadRadius: 0.5,
            //   )
            // ],
            border: Border.all(color: deepBlue, width: 1),
            borderRadius: BorderRadius.circular(12)),
        child: Center(
          child: BoldText(txt, deepBlue, 12),
        ),
      ),
    ),
  );
}

// Interactive Contents ------>>>
Widget categories(String image, String text) {
  return Center(
    child: Column(
      children: [
        Container(
          height: 130,
          width: 280,
          decoration: BoxDecoration(
              image:
                  DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(color: hint, spreadRadius: 0.5, blurRadius: 3)
              ]),
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(45, 10, 45, 10),
          child: ReadMoreText(
            text,
            style: const TextStyle(
              color: Colors.black54,
              fontSize: 16,
            ),
            trimLength: 4,
            colorClickableText: deepBlue,
            trimMode: TrimMode.Line,
            trimCollapsedText: 'Read more',
            lessStyle: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black38),
            trimExpandedText: '  Read less',
            moreStyle: const TextStyle(
                fontSize: 14, fontWeight: FontWeight.bold, color: deepBlue),
          ),
        ),
      ],
    ),
  );
}
