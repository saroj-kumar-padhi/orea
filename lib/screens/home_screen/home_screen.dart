import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../common_utils/common_utils.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({Key? key}) : super(key: key);

  @override
  State<homeScreen> createState() => _homeScreen();
}

class _homeScreen extends State<homeScreen> {
  CollectionReference propertiesRef =
      FirebaseFirestore.instance.collection('users');

  Future<QuerySnapshot> fetchProperties() async {
    return await propertiesRef.where('type', isEqualTo: 'Home').get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: BoldText("HOME", deepGreer, 18),
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
      body: FutureBuilder<QuerySnapshot>(
          future: fetchProperties(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (!snapshot.hasData) {
              return const Text("no data available");
            }

            List<QueryDocumentSnapshot> documents = snapshot.data!.docs;

            return ListView.builder(
                itemCount: documents.length,
                itemBuilder: ((context, index) {
                  Map<String, dynamic>? data =
                      documents[index].data() as Map<String, dynamic>?;
                  return listItem(
                      data!['imageUrl'],
                      data['propertyTitle'],
                      "PKR ${data['amount']}",
                      data['propertyDescription'],
                      context);
                }));
          }),
    );
  }
}

//Clickable Tabs ---------->>>
Widget listItem(image, title, rate, description, context) {
  String trimmedDescription = description.substring(0, 25).trim();
  if (description.length > 25) {
    trimmedDescription += "...";
  }
// print(trimmedDescription);
  return Column(
    children: [
      const SizedBox(height: 15),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 100,
              width: 150,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  border: Border.all(color: deepBlue, width: 1),
                  image: DecorationImage(
                    image: NetworkImage(image),
                    fit: BoxFit.cover,
                  )),
            ),
            const SizedBox(width: 22),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BoldText(title, deepBlue, 17),
                const SizedBox(width: 8),
                Row(
                  children: [
                    BoldText("PKR ", deepGreer, 15),
                    BoldText(rate, Colors.red, 15),
                  ],
                ),
                const SizedBox(height: 2),
                LightText(trimmedDescription, deepGreer, 14),
              ],
            ),
          ],
        ),
      ),
      const SizedBox(height: 10),
      const Divider(color: hint),
      const SizedBox(height: 10),
    ],
  );
}

// Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         title: BoldText("PLOT", deepGreer, 18),
//         centerTitle: true,
//         elevation: 0.5,
//         backgroundColor: whiteColor,
//         leading: IconButton(
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           icon: const Icon(Icons.arrow_back, color: black),
//         ),
//       ),
//       body: FutureBuilder<QuerySnapshot>(
//           future: fetchProperties(),
//           builder: (context, snapshot) {
//             if (snapshot.hasError) {
//               return Text('Error: ${snapshot.error}');
//             }
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return const Center(
//                 child: CircularProgressIndicator(),
//               );
//             }
//             List<QueryDocumentSnapshot> documents = snapshot.data!.docs;
//             return ListView.builder(
//                 itemCount: documents.length,
//                 itemBuilder: (context, index) {
//                   Map<String, dynamic>? data =
//                       documents[index].data() as Map<String, dynamic>?;
//                   return ListTile(
//                     leading: Expanded(
//                       child: ClipRRect(
//                         child: Container(
//                           height: 100,
//                           width: 150,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(5),
//                             border: Border.all(color: deepBlue, width: 1),
//                             image: DecorationImage(
//                                 image: NetworkImage(data!['imageUrl']),
//                                 fit: BoxFit.cover),
//                           ),
//                         ),
//                       ),
//                     ),
//                     trailing: BoldText(data['propertyTitle'], deepBlue, 15),
//                   );
//                 });
//           }),
//     );