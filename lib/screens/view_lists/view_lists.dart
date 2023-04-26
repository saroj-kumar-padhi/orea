import 'package:Orea/screens/buy_property/buy_property.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:Orea/common_utils/common_utils.dart';

import 'package:Orea/screens/place_your_bid/place_your_bid.dart';

class ViewListings extends StatefulWidget {
  const ViewListings({super.key});

  @override
  State<ViewListings> createState() => _ViewListings();
}

class _ViewListings extends State<ViewListings> {
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

    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    final CollectionReference propertiesRef = firestore.collection('users');
    Future<QuerySnapshot<Map<String, dynamic>>> fetchAppropedRequest() async {
      final Query query = propertiesRef.where('status', isEqualTo: 'approved');
      final QuerySnapshot<Map<String, dynamic>> snapshot =
          await query.get() as QuerySnapshot<Map<String, dynamic>>;

      return snapshot;
    }

    return FutureBuilder<QuerySnapshot>(
        future: FirebaseFirestore.instance
            .collection('listings')
            .where('status', isEqualTo: 'approved')
            .get(),
        builder: (context, snapshot) {
          // Your code here
          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title: BoldText("All LISTINGS", deepGreer, 18),
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
                padding: const EdgeInsets.fromLTRB(24, 44, 24, 10),
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
                          documents = snapshot.data?.docs as List<
                              QueryDocumentSnapshot<Map<String, dynamic>>>;
                      return ListView.builder(
                          itemCount: documents.length,
                          itemBuilder: (context, index) {
                            Map<String, dynamic>? data =
                                documents[index].data();
                            return Column(
                              children: [
                                listItem(data['imageUrl'], () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => BuyProperty(
                                        id: documents[index].id,
                                        imageUrl: data['imageUrl'],
                                        discription:
                                            data['propertyDescription'],
                                        amount: data['amount'],
                                        propertyTitle: data['propertyTitle'],
                                      ),
                                    ),
                                  );
                                }, () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => PlaceYourBid(
                                        id: documents[index].id,
                                        imageUrl: data['imageUrl'],
                                        discription:
                                            data['propertyDescription'],
                                        amount: data['amount'],
                                        propertyTitle: data['propertyTitle'],
                                      ),
                                    ),
                                  );
                                }, data['propertyTitle'] ?? 'N/A', user!.email),
                                const SizedBox(
                                  height: 27,
                                ),
                                const Divider(color: hint),
                                const SizedBox(height: 27),
                              ],
                            );
                          });
                    }),
              ),
            ),
          );
        });
  }

  //Clickable Tabs ---------->>>
  Widget listItem(image, onTap, onTap2, title, email) {
    return Row(
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
                    image: NetworkImage(image), fit: BoxFit.cover),
              ),
            ),
          ),
        ),
        const SizedBox(width: 22),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          BoldText(title, deepBlue, 17),
          const SizedBox(height: 2),
          LightText("by Asif Raza\n${email}", deepGreer, 13),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MaterialButton(
                elevation: 0.0,
                color: deepBlue,
                height: 28,
                minWidth: 95,
                onPressed: onTap,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                    side: const BorderSide(color: deepBlue)),
                child: BoldText("BUY", whiteColor, 13),
              ),
              const SizedBox(width: 8),
              MaterialButton(
                elevation: 0.0,
                color: whiteColor,
                height: 28,
                minWidth: 95,
                onPressed: onTap2,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                    side: const BorderSide(color: deepBlue)),
                child: BoldText("BID", deepBlue, 13),
              ),
            ],
          )
        ]),
      ],
    );
  }
}
