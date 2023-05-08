import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../common_utils/common_utils.dart';
import '../../common_utils/image_paths.dart';

class commercialScreen extends StatefulWidget {
  const commercialScreen({Key? key}) : super(key: key);

  @override
  State<commercialScreen> createState() => _commercialScreen();
}

class _commercialScreen extends State<commercialScreen> {
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
        title: BoldText("COMMERCIAL", deepGreer, 18),
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              listItem(ImagePath.house, "Property Title", "PKR 2CR",
                  "by Asif Raza | asif@gmail.com"),
              listItem(ImagePath.house, "Property Title", "PKR 2CR",
                  "by Asif Raza | asif@gmail.com"),
              listItem(ImagePath.house, "Property Title", "PKR 2CR",
                  "by Asif Raza | asif@gmail.com"),
            ],
          ),
        ),
      ),
    );
  }
}

//Clickable Tabs ---------->>>
Widget listItem(image, title, rate, owner) {
  return Column(
    children: [
      const SizedBox(height: 7),
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
                    image: AssetImage(image),
                    fit: BoxFit.cover,
                  )),
            ),
          ),
          const SizedBox(width: 22),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BoldText(title, deepGreer, 17),
              const SizedBox(width: 8),
              BoldText(rate, deepBlue, 17),
              const SizedBox(height: 2),
              LightText(owner, deepGreer, 13),
            ],
          ),
        ],
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