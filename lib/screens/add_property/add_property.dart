import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:Orea/common_utils/common_utils.dart';

import '../property_added_by_you/property_added_by_you.dart';

class AddProperty extends StatelessWidget {
  const AddProperty({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController addProperty = TextEditingController();
    final TextEditingController addDescription = TextEditingController();
    final TextEditingController addAmount = TextEditingController();
    CollectionReference usersRef =
        FirebaseFirestore.instance.collection('users');
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: BoldText("ADD PROPERTY", deepGreer, 18),
        centerTitle: true,
        elevation: 0.0,
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
          padding: const EdgeInsets.fromLTRB(27, 30, 27, 30),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LightText("Add your property OREA", deepGreer, 12),
                const SizedBox(height: 22),
                BoldText("Add property details", deepGreer, 13),
                const SizedBox(height: 30),
                LightText(
                    "Add on the image showing the overview of your\nproperty",
                    deepGreer,
                    13),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Container(
                      height: 100,
                      width: 150,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: whiteColor,
                          border: Border.all(width: 1, color: deepBlue)),
                      child: Center(
                          child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.add,
                          color: deepBlue,
                          size: 30,
                        ),
                      )),
                    ),
                    const SizedBox(width: 15),
                    BoldText("Select Image", deepBlue, 15)
                  ],
                ),
                const SizedBox(height: 30),
                BoldText("Add property Tilte", black, 15),
                const SizedBox(height: 10),
                TextFormField(
                  controller: addProperty,
                  autofocus: false,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    fillColor: whiteColor,
                    filled: true,
                    contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(color: deepBlue)),
                  ),
                ),
                const SizedBox(height: 30),
                BoldText("Add property Description", black, 15),
                const SizedBox(height: 10),
                TextFormField(
                  controller: addDescription,
                  minLines: 3,
                  maxLines: 5,
                  maxLength: 100,
                  autofocus: false,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    fillColor: whiteColor,
                    filled: true,
                    contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(color: deepBlue)),
                  ),
                ),
                BoldText("Add amount", black, 15),
                const SizedBox(height: 10),
                TextFormField(
                  controller: addAmount,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    fillColor: whiteColor,
                    filled: true,
                    contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(color: deepBlue)),
                  ),
                ),
                const SizedBox(height: 70),
                MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    color: deepBlue,
                    elevation: 0.0,
                    height: 40,
                    minWidth: MediaQuery.of(context).size.width,
                    onPressed: () async {
                      Map<String, String> data = {
                        'propertyName': addProperty.text,
                        'propertyDescription': addDescription.text,
                        'addAmoount': addAmount.text,
                        'status': 'panding',
                        'userId': FirebaseAuth.instance.currentUser!.uid
                      };
                      DocumentReference docRef = await usersRef.add(data);
                      print('Added document with ID: ${docRef.id}');

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AddedByYou()));
                    },
                    child: BoldText("Add Property", whiteColor, 18)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
