import 'package:Orea/common_utils/common_utils.dart';
import 'package:Orea/common_utils/image_paths.dart';
import 'package:Orea/screens/welcome_screen/welcome_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../pending_request/pending_request.dart';

class OreaAdmin extends StatefulWidget {
  const OreaAdmin({super.key});

  @override
  State<OreaAdmin> createState() => _OreaAdmin();
}

class _OreaAdmin extends State<OreaAdmin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const Spacer(),
            const Icon(Icons.manage_accounts_rounded,
                color: deepBlue, size: 30),
            const SizedBox(width: 10),
            BoldText("OREA ADMIN PANEL", deepGreer, 18),
            const SizedBox(width: 45),
            const Spacer(),
          ],
        ),
        centerTitle: true,
        backgroundColor: whiteColor,
        elevation: 1.0,
      ),
      backgroundColor: whiteColor,
      body: Column(
        children: [
          const SizedBox(
            height: 100,
          ),
          Image.asset(ImagePath.orea, height: 140),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Container(
                decoration: BoxDecoration(
                  color: whiteColor,
                  // border: Border.all(width: 1, color: deepBlue),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.grey, spreadRadius: 1, blurRadius: 2)
                  ],
                  borderRadius: BorderRadius.circular(7),
                ),
                child: Center(
                    child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      BoldText("Welcome admin", deepGreer, 15),
                      const SizedBox(width: 5),
                      const Icon(Icons.verified_user_rounded,
                          color: deepBlue, size: 20),
                      const SizedBox(width: 5),
                      BoldText("Aziz Ullah", deepGreer, 15),
                    ],
                  ),
                ))),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.info, color: Colors.black54, size: 13),
                BoldText(
                    " Check the latest activities and requests using below tabs",
                    Colors.black54,
                    10),
              ],
            ),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              adminTabs("Requests", () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PendingRequest()));
              }, context),
              // adminTabs("EDIT LISTINGS", () {
              //   Navigator.push(
              //       context,
              //       MaterialPageRoute(
              //           builder: (context) => const AllListingsDelete()));
              // }, context),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // adminTabs("HISTORY", () {
              //   Navigator.of(context).push(MaterialPageRoute(
              //       builder: (context) => const HistoryScreen()));
              // }, context),
              adminTabs("Log Out", () async {
                await FirebaseAuth.instance.signOut();
                // ignore: use_build_context_synchronously
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const WelcomeScreen()));
              }, context),
            ],
          ),
          const SizedBox(height: 80),
          // Container(
          //   height: 40,
          //   width: MediaQuery.of(context).size.width,
          //   decoration: BoxDecoration(
          //       gradient: LinearGradient(
          //     begin: Alignment.bottomCenter,
          //     end: Alignment.topCenter,
          //     colors: [
          //       Colors.blue.shade200,
          //       Colors.white,
          //     ],
          //   )),
          // )
        ],
      ),
    );
  }
}

//Clickable Tabs ---------->>>
adminTabs(txt, clk, context) {
  return InkWell(
    onTap: clk,
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 63,
        width: MediaQuery.of(context).size.width / 1.5,
        decoration: BoxDecoration(
            color: whiteColor,
            border: Border.all(color: deepBlue, width: 1),
            borderRadius: BorderRadius.circular(12)),
        child: Center(
          child: BoldText(txt, deepGreer, 16),
        ),
      ),
    ),
  );
}
