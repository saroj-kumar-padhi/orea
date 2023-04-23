import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:Orea/common_utils/common_utils.dart';

class BidHistory extends StatefulWidget {
  const BidHistory({super.key});

  @override
  State<BidHistory> createState() => _BidHistory();
}

class _BidHistory extends State<BidHistory> {
  @override
  Widget build(BuildContext context) {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    final CollectionReference propertiesRef = firestore.collection('users');
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
                        return Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              child: Image.network(
                                data['imageUrl'],
                                height: 100,
                                width: 120,
                              ),
                            ),
                            const SizedBox(width: 22),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(children: [
                                  BoldText("Property Title", deepGreer, 15),
                                  const SizedBox(width: 8),
                                  BoldText(data['propertyTitle'] ?? 'N/A',
                                      deepBlue, 15),
                                ]),
                                const SizedBox(height: 15),
                                Row(
                                  children: [
                                    LightText("placed by dilshad@gmail.com",
                                        deepGreer, 11),
                                  ],
                                ),
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
                        );
                      }));
                })),
      ),
    );
  }
}
