import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:Orea/common_utils/common_utils.dart';
import 'package:Orea/common_utils/image_paths.dart';
import 'package:Orea/screens/admin_user/admin_user.dart';
import 'package:Orea/screens/edit_all_listings_delete/edit_all_listings.dart';
import 'package:Orea/screens/history_screen/history_screen.dart';

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
        title: BoldText("OREA ADMIN PANEL", deepGreer, 18),
        centerTitle: true,
        backgroundColor: whiteColor,
        elevation: 0.0,
      ),
      backgroundColor: whiteColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(34, 0, 34, 30),
          child: Column(
            children: [
              const SizedBox(
                height: 125.31,
              ),
              Image.asset(ImagePath.orea, height: 140),
              const SizedBox(
                height: 125.31,
              ),
              BoldText("Welcome admin | Aziz Ullah", deepGreer, 18),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  adminTabs("REQUESTS", () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PendingRequest()));
                  }, context),
                  adminTabs("EDIT LISTINGS", () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AllListingsDelete()));
                  }, context),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  adminTabs("HISTORY", () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const HistoryScreen()));
                  }, context),
                  adminTabs("LOGOUT", () async {
                    await FirebaseAuth.instance.signOut();
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AdminUserScreen()));
                  }, context),
                ],
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
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
        width: MediaQuery.of(context).size.width / 2.9,
        decoration: BoxDecoration(
            color: whiteColor,
            border: Border.all(color: deepBlue, width: 1),
            borderRadius: BorderRadius.circular(12)),
        child: Center(
          child: BoldText(txt, deepBlue, 12),
        ),
      ),
    ),
  );
}
