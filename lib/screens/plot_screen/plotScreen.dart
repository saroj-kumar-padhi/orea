import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class plotScreen extends StatefulWidget {
  const plotScreen({Key? key}) : super(key: key);

  @override
  State<plotScreen> createState() => _plotScreenState();
}

class _plotScreenState extends State<plotScreen> {
  CollectionReference propertiesRef =
      FirebaseFirestore.instance.collection('users');

  Future<QuerySnapshot> fetchProperties() async {
    return await propertiesRef.where('type', isEqualTo: 'plot').get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<QuerySnapshot>(
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
            return ListView.builder(
                itemCount: documents.length,
                itemBuilder: (context, index) {
                  Map<String, dynamic>? data =
                      documents[index].data() as Map<String, dynamic>?;
                  return ListTile(
                    leading: Image.network(data!['imageUrl']),
                    trailing: Text(data['propertyTitle']),
                  );
                });
          }),
    );
  }
}
