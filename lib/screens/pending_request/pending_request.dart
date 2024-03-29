import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:Orea/common_utils/common_utils.dart';

class PendingRequest extends StatefulWidget {
  const PendingRequest({super.key});

  @override
  State<PendingRequest> createState() => _PendingRequestState();
}

class _PendingRequestState extends State<PendingRequest> {
  Future<QuerySnapshot<Map<String, dynamic>>> fetchPendingProperties() async {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    final CollectionReference propertiesRef = firestore.collection('users');

    final Query query = propertiesRef.where('status', isEqualTo: 'panding');
    final QuerySnapshot<Map<String, dynamic>> snapshot =
        await query.get() as QuerySnapshot<Map<String, dynamic>>;

    return snapshot;
  }

  @override
  Widget build(BuildContext context) {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    final CollectionReference propertiesRef = firestore.collection('users');
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: BoldText("PENDING REQUESTS", deepGreer, 18),
        centerTitle: true,
        elevation: 1,
        backgroundColor: whiteColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back, color: black),
        ),
      ),
      body: FutureBuilder<QuerySnapshot>(
        future: fetchPendingProperties(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // return a loading indicator while the data is being fetched
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            // handle any errors that occur while fetching the data
            return const Center(child: Text('Error fetching data'));
          }
          final List<QueryDocumentSnapshot<Map<String, dynamic>>> documents =
              snapshot.data?.docs
                  as List<QueryDocumentSnapshot<Map<String, dynamic>>>;
          return ListView.builder(
            itemCount: documents.length,
            itemBuilder: (context, index) {
              Map<String, dynamic>? data = documents[index].data();
              return Padding(
                padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                child: Column(
                  children: [
                    listItem(data['imageUrl'], data['propertyTitle'] ?? 'N/A',
                        data['amount'],
                        // APPROVE ------->>>
                        () async {
                      // get the document reference for the property
                      final DocumentReference propertyRef =
                          propertiesRef.doc(documents[index].id);
                      // update the status of the property to approved
                      await propertyRef.update({'status': 'approved'});

                      // rebuild the list view to reflect the updated status
                      setState(() {});

                      // ignore: use_build_context_synchronously
                    }, () {
                      final DocumentReference propertyRef =
                          propertiesRef.doc(documents[index].id);

                      propertyRef.delete();

                      setState(() {});
                    }, context),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}

//Clickable Tabs ---------->>>
Widget listItem(image, title, rate, approve, decline, context) {
  return Column(
    children: [
      const SizedBox(height: 12),
      Row(
        children: [
          Expanded(
            child: Container(
              height: 70,
              width: 110,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  border: Border.all(color: deepBlue, width: 1),
                  image: DecorationImage(
                    image: NetworkImage(image),
                    fit: BoxFit.cover,
                  )),
            ),
          ),
          const SizedBox(width: 22),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                BoldText(title, deepGreer, 16),
                const SizedBox(width: 10),
                // ignore: unnecessary_brace_in_string_interps
                BoldText("PKR ${rate}", deepBlue, 16)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MaterialButton(
                  elevation: 0.0,
                  color: deepBlue,
                  height: 28,
                  minWidth: 95,
                  onPressed: approve,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                      side: const BorderSide(color: deepBlue)),
                  child: BoldText("Approve", whiteColor, 13),
                ),
                const SizedBox(width: 8),
                MaterialButton(
                  elevation: 0.0,
                  color: whiteColor,
                  height: 28,
                  minWidth: MediaQuery.of(context).size.width / 3.5,
                  onPressed: decline,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                      side: const BorderSide(color: deepBlue)),
                  child: BoldText("Decline", deepBlue, 13),
                ),
              ],
            )
          ]),
        ],
      ),
      const SizedBox(height: 15),
      const Divider(color: hint),
    ],
  );
}
