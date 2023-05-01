import 'package:Orea/screens/user_profile/user_profile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../common_utils/common_utils.dart';
import '../../common_utils/image_paths.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController fullName = TextEditingController();
    final TextEditingController address = TextEditingController();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: whiteColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: BoldText("EDIT YOUR PROFILE", deepGreer, 18),
        centerTitle: true,
        elevation: 0.5,
        backgroundColor: whiteColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back, color: black),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(26, 10, 26, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                child: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                      color: deepBlue,
                      borderRadius: BorderRadius.circular(100),
                      image: DecorationImage(
                          image: AssetImage(
                            ImagePath.profile,
                          ),
                          fit: BoxFit.fill)),
                ),
              ),
              const SizedBox(height: 30),
              Row(
                children: [
                  const SizedBox(width: 20),
                  LightText("Enter full name ", black, 15),
                ],
              ),
              const SizedBox(height: 5),
              TextFormField(
                controller: fullName,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  fillColor: whiteColor,
                  filled: true,
                  contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(color: deepBlue)),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  const SizedBox(width: 20),
                  LightText("Enter your  Address",black, 15),
                ],
              ),
              const SizedBox(height: 5),
              TextFormField(
                controller: address,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  fillColor: whiteColor,
                  filled: true,
                  contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(color: deepBlue)),
                ),
              ),
              const SizedBox(height: 30),
              MaterialButton(
                color: deepBlue,
                height: 40,
                minWidth: MediaQuery.of(context).size.width,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(28)),
                onPressed: () async {
                  FirebaseAuth auth = FirebaseAuth.instance;
                  String? userId = auth.currentUser?.uid;
                  if (userId != null) {
                    CollectionReference usersRef =
                        FirebaseFirestore.instance.collection('info');
                    QuerySnapshot querySnapshot = await usersRef
                        .where('userUid', isEqualTo: userId)
                        .get();
                    if (querySnapshot.size > 0) {
                      DocumentSnapshot docSnapshot = querySnapshot.docs.first;
                      Map<String, dynamic> updateData = {
                        'name': fullName.text,
                        'Address': address.text,
                      };
                      await docSnapshot.reference.update(updateData);
                      // Document updated successfully
                    } else {
                      // User not found in the collection
                    }
                  } else {
                    // User not signed in
                  }

                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const UserProfile()));
                },
                child: BoldText("Save Profile", whiteColor, 18),
              ),
              const SizedBox(
                height: 30,
              )
            ],
          ),
        ),
      ),
    );
  }
}
