import 'package:Orea/common_utils/image_paths.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:Orea/common_utils/common_utils.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HistoryScreen> createState() => _HistoryScreen();
}

class _HistoryScreen extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user = auth.currentUser;
    if (user != null) {
      // User is signed in, you can access the email address
      String? email = user.email;
      // ignore: avoid_print
      print('User email: $email');
    } else {
      // User is not signed in
      // ignore: avoid_print
      print('User is not signed in');
    }

    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    final CollectionReference propertiesRef = firestore.collection('users');
    // ignore: unused_element
    Future<QuerySnapshot<Map<String, dynamic>>> fetchAppropedRequest() async {
      final Query query = propertiesRef.where('status', isEqualTo: 'approved');
      final QuerySnapshot<Map<String, dynamic>> snapshot =
          await query.get() as QuerySnapshot<Map<String, dynamic>>;

      return snapshot;
    }

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: BoldText("BIDS HISTORY", deepGreer, 18),
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
          padding: const EdgeInsets.fromLTRB(24, 24, 24, 10),
          child: FutureBuilder<QuerySnapshot>(
            future: FirebaseFirestore.instance
                .collection('users')
                .where('status', isEqualTo: 'approved')
                .get(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                // return a loading indicator while the data is being fetched
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                // handle any errors that occur while fetching the data
                return const Center(child: Text('Error fetching data'));
              }
              final List<QueryDocumentSnapshot<Map<String, dynamic>>>
                  documents = snapshot.data?.docs
                      as List<QueryDocumentSnapshot<Map<String, dynamic>>>;
              return ListView.builder(
                itemCount: documents.length,
                itemBuilder: ((context, index) {
                  Map<String, dynamic>? data = documents[index].data();
                  return Column(
                    children: [
                      //  Image.network(
                      //         data['imageUrl'],
                      //         height: 100,
                      //         width: 120,
                      Row(
                        children: [
                          Expanded(
                            child: ClipRRect(
                              child: Container(
                                height: 100,
                                width: 150,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(color: deepBlue, width: 1),
                                  image: DecorationImage(
                                      image: NetworkImage(data['imageUrl'] ??
                                          AssetImage(ImagePath.house)),
                                      fit: BoxFit.cover),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 22),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(children: [
                                BoldText(data['propertyTitle'] ?? 'N/A',
                                    deepBlue, 15),
                              ]),
                              const SizedBox(height: 15),
                              Row(
                                children: [
                                  LightText("placed by 'BidUser' name",
                                      deepGreer, 11),
                                ],
                              ),
                              LightText("${user!.email}", deepGreer, 11),
                              const SizedBox(height: 5),
                              Row(
                                children: [
                                  LightText(
                                      "Amount: ${data['bidAmount'] + " pkr" ?? "9999"}",
                                      deepGreer,
                                      11),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      )
                    ],
                  );
                }),
              );
            },
          ),
        ),
      ),
    );
  }
}
