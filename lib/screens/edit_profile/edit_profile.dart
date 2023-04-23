import 'package:Orea/screens/user_profile/user_profile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../common_utils/common_utils.dart';
import '../../common_utils/image_paths.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController fullName = TextEditingController();
    TextEditingController phoneNumber = TextEditingController();
    TextEditingController address = TextEditingController();
    return Scaffold(
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
          padding: const EdgeInsets.fromLTRB(26, 38, 26, 0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                ClipRRect(
                  child: Expanded(
                    child: Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                          color: hint,
                          boxShadow: const [],
                          borderRadius: BorderRadius.circular(100),
                          image: DecorationImage(
                              image: AssetImage(ImagePath.profile),
                              fit: BoxFit.fill)),
                    ),
                  ),
                ),
                const SizedBox(height: 46),
                Row(
                  children: [
                    const SizedBox(width: 20),
                    LightText("Enter full name ", black, 15),
                  ],
                ),
                const SizedBox(height: 5),
                TextFormField(
                  controller: fullName,
                  autofocus: false,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    fillColor: whiteColor,
                    filled: true,
                    contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                    hintText: "Full Name",
                    hintStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: "Poppins",
                        color: hint,
                        fontSize: 15),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(color: deepBlue)),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    const SizedBox(width: 20),
                    LightText("Enter your phone number", black, 15),
                  ],
                ),
                const SizedBox(height: 5),
                TextFormField(
                  controller: phoneNumber,
                  autofocus: false,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    fillColor: whiteColor,
                    filled: true,
                    contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                    hintText: "Phone number",
                    hintStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: "Poppins",
                        color: hint,
                        fontSize: 15),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(color: deepBlue)),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    const SizedBox(width: 20),
                    LightText("Enter your email", black, 15),
                  ],
                ),
                const SizedBox(height: 5),
                TextFormField(
                  autofocus: false,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    fillColor: whiteColor,
                    filled: true,
                    contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                    hintText: "Email Id",
                    hintStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: "Poppins",
                        color: hint,
                        fontSize: 15),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(color: deepBlue)),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    const SizedBox(width: 20),
                    LightText("Enter your address", black, 15),
                  ],
                ),
                const SizedBox(height: 5),
                TextFormField(
                  controller: address,
                  autofocus: false,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    fillColor: whiteColor,
                    filled: true,
                    contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                    hintText: "Address",
                    hintStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: "Poppins",
                        color: hint,
                        fontSize: 15),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(color: deepBlue)),
                  ),
                ),
                const SizedBox(height: 70),
                MaterialButton(
                  color: deepBlue,
                  height: 40,
                  minWidth: MediaQuery.of(context).size.width,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28)),
                  onPressed: () {
                    FirebaseAuth auth = FirebaseAuth.instance;
                    User? user = auth.currentUser;
                    String? userId = user?.uid;
                    final FirebaseFirestore firestore =
                        FirebaseFirestore.instance;
                    final CollectionReference usersRef =
                        firestore.collection('users');
                    usersRef.doc(userId).update({
                      'fullName': fullName.text,
                      'phoneNumber': phoneNumber.text,
                      'address': address.text,
                    });

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const UserProfile()));
                  },
                  child: BoldText("Save Profile", whiteColor, 18),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
