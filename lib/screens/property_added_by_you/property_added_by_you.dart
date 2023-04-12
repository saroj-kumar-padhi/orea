import 'package:Orea/screens/bid_history/bid_history.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:Orea/common_utils/common_utils.dart';

import 'package:Orea/common_utils/image_paths.dart';

class AddedByYou extends StatefulWidget {
  const AddedByYou({super.key});

  @override
  State<AddedByYou> createState() => _AddedByYou();
}

class _AddedByYou extends State<AddedByYou> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        elevation: 0.0,
        automaticallyImplyLeading: false,
        title: BoldText("ADDED BY YOU", deepGreer, 18),
        centerTitle: true,
        // elevation: 0.5,
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
          padding: const EdgeInsets.fromLTRB(24, 34, 24, 10),
          child: FutureBuilder<QuerySnapshot>(
              future: fetchProperties(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                List<QueryDocumentSnapshot> documents = snapshot.data!.docs;
                return Column(
                  children: [
                    LightText("Properties you have added will be shown here",
                        deepGreer, 13),
                    Expanded(
                      child: ListView.builder(
                          itemCount: documents.length,
                          itemBuilder: (context, index) {
                            Map<String, dynamic>? data = documents[index].data()
                                as Map<String, dynamic>?;
                            return Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(5),
                                  child: Image.asset(
                                    ImagePath.house,
                                    height: 100,
                                    width: 120,
                                  ),
                                ),
                                const SizedBox(width: 22),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    BoldText("Property Title", deepGreer, 17),
                                    const SizedBox(width: 8),
                                    BoldText(data?['propertyName'] ?? 'N/A',
                                        deepBlue, 17),
                                    const SizedBox(height: 2),
                                    LightText("added by you", deepGreer, 13),
                                  ],
                                ),
                                Expanded(
                                  flex: 19,
                                  child: IconButton(
                                    onPressed: () async {
                                      await documents[index].reference.delete();
                                      setState(() {
                                        // rebuild the list view after deleting the document
                                      });
                                    },
                                    icon: const Icon(
                                      Icons.delete,
                                      color: deepBlue,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 35),
                                const Divider(color: hint),
                                const SizedBox(height: 35),
                              ],
                            );
                          }),
                    ),
                    MaterialButton(
                      color: deepBlue,
                      height: 40,
                      minWidth: MediaQuery.of(context).size.height,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const BidHistory(),
                          ),
                        );
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: BoldText("Save Chages", whiteColor, 18),
                    ),
                  ],
                );
              }),
        ),
      ),
    );
  }

  String uid = FirebaseAuth.instance.currentUser!.uid;
  CollectionReference propertiesRef =
      FirebaseFirestore.instance.collection('users');

  Future<QuerySnapshot> fetchProperties() async {
    return await propertiesRef.where('userId', isEqualTo: uid).get();
  }
}

//Clickable Tabs ---------->>>
Widget listItem(
  image,
) {
  return Row(
    children: [
      ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Image.asset(
          image,
          height: 100,
          width: 120,
        ),
      ),
      const SizedBox(width: 22),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BoldText("Property Title", deepGreer, 17),
          const SizedBox(width: 8),
          BoldText("PKR 2CR", deepBlue, 17),
          const SizedBox(height: 2),
          LightText("added by you", deepGreer, 13),
        ],
      ),
      Expanded(
        flex: 19,
        child: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.delete,
            color: deepBlue,
          ),
        ),
      ),
      const SizedBox(height: 35),
      const Divider(color: hint),
      const SizedBox(height: 35),
    ],
  );
}
