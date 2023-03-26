import 'package:Orea/screens/admin_user/admin_user.dart';
import 'package:flutter/material.dart';
import 'package:Orea/common_utils/common_utils.dart';
import 'package:Orea/common_utils/image_paths.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
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
                width: 30,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BoldText("User Name", deepGreer, 16),
                  BoldText("useremail@gmail.com", deepBlue, 16),
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
                          onTap: () {},
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
                          onTap: () {},
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
                          onTap: () {},
                          child: BoldText("Purchase History", whiteColor, 17),
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
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>const AdminUserScreen()));
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
