import 'package:Orea/screens/admin_user/admin_user.dart';
import 'package:Orea/screens/contact_us_screen/contact_us_screen.dart';
import 'package:Orea/screens/property_added_by_you/property_added_by_you.dart';
import 'package:flutter/material.dart';
import 'package:Orea/common_utils/common_utils.dart';
import 'package:Orea/common_utils/image_paths.dart';

import '../edit_profile/edit_profile.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user = auth.currentUser;
    if (user != null) {
      // User is signed in, you can access the email address
      String? email = user.email;
      print('User email: $email');
    } else {
      // User is not signed in
      print('User is not signed in');
    }

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: deepGreer,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: BoldText("PROFILE", deepGreer, 18),
        centerTitle: true,
        elevation: 0,
        backgroundColor: whiteColor,
      ),
      backgroundColor: whiteColor,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          const SizedBox(
            height: 50,
          ),
          Row(
            children: [
              const Padding(padding: EdgeInsets.all(10)),
              Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                    color: hint,
                    boxShadow: const [],
                    borderRadius: BorderRadius.circular(100),
                    image: DecorationImage(
                        image: AssetImage(ImagePath.profile),
                        fit: BoxFit.fill)),
              ),
              const SizedBox(
                width: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BoldText("Name:", deepGreer, 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      BoldText("Email: ", deepGreer, 16),
                      BoldText("${user?.email}", deepBlue,
                          16),
                    ],
                  ),
                  BoldText("Phone no. :", deepGreer, 16),
                  BoldText("Address:", deepGreer, 16)
                ],
              ),
            ],
          ),
          const SizedBox(height: 70),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                  color: deepGreer,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(18),
                      topRight: Radius.circular(18))),
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  children: [
                    Align(
                        alignment: Alignment.topCenter,
                        child: BoldText(
                            "Welcome to your Profile", whiteColor, 20)),
                    SizedBox(height: MediaQuery.of(context).size.height / 10),
                    Row(
                      children: [
                        const Icon(Icons.arrow_forward,
                            color: whiteColor, size: 21),
                        const SizedBox(width: 10),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const EditProfileScreen()));
                          },
                          child: BoldText("Edit profile", whiteColor, 17),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        const Icon(Icons.arrow_forward,
                            color: whiteColor, size: 21),
                        const SizedBox(width: 10),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const AddedByYou(),
                              ),
                            );
                          },
                          child:
                              BoldText("View your properties", whiteColor, 17),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        const Icon(Icons.arrow_forward,
                            color: whiteColor, size: 21),
                        const SizedBox(width: 10),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ContactUsScreen(),
                              ),
                            );
                          },
                          child: BoldText("Contact Us", whiteColor, 17),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        const Icon(Icons.arrow_forward,
                            color: whiteColor, size: 21),
                        const SizedBox(width: 10),
                        GestureDetector(
                          onTap: () async{
                            await FirebaseAuth.instance.signOut();
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const AdminUserScreen()));
                          },
                          child: BoldText("Log Out", whiteColor, 17),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
