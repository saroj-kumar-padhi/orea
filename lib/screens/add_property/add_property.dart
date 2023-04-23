import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:Orea/common_utils/common_utils.dart';
import 'package:image_picker/image_picker.dart';

import '../property_added_by_you/property_added_by_you.dart';

class AddProperty extends StatefulWidget {
  const AddProperty({super.key});

  @override
  State<AddProperty> createState() => _AddPropertyState();
}

class _AddPropertyState extends State<AddProperty> {
  String placeholderImage = 'assets/images/placeholder.png';
  XFile? photo;
  final TextEditingController addProperty = TextEditingController();
  final TextEditingController addDescription = TextEditingController();
  final TextEditingController addAmount = TextEditingController();

  // Upload the image to Firebase Storage
  Future<String> uploadImageToStorage(XFile? photo) async {
    if (photo == null || photo.path.isEmpty) {
      // Handle the case when photo is null or its path is empty
      log("no file selected");
      return '';
    }
    String fileName = '${DateTime.now().millisecondsSinceEpoch}.png';
    Reference ref = FirebaseStorage.instance.ref().child(fileName);
    UploadTask uploadTask = ref.putFile(File(photo.path));
    TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => null);

    String imageUrl = await taskSnapshot.ref.getDownloadURL();
    if (taskSnapshot.state == TaskState.success) {
      imageUrl = await taskSnapshot.ref.getDownloadURL();
    }

    return imageUrl;
  }

  Future<String> pickImageFromGallery() async {
    final picker = ImagePicker();
    var pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      photo = pickedFile;
      // Use the picked image file as needed
      String imageUrl = await uploadImageToStorage(photo);
      setState(() {
        placeholderImage = imageUrl;
      });
      print('Picked image path: $placeholderImage');
    } else {
      // User cancelled the image picking
      print('No image picked');
    }
    return placeholderImage;
  }

  // Function to save download URL to Firestore
  Future<void> savePropertyToFirestore(String imageUrl, String propertyTitle,
      String propertyDescription, String amount) async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        CollectionReference propertiesRef =
            FirebaseFirestore.instance.collection('users');
        await propertiesRef.add({
          'imageUrl': imageUrl,
          'propertyTitle': propertyTitle,
          'propertyDescription': propertyDescription,
          'amount': amount,
          'addedBy': user.uid,
          'createdAt': FieldValue.serverTimestamp(),
          'status': 'panding',
          'bidAmount': '',
          'bidDescription': ''
        });
        // Success, show toast or dialog
      }
    } catch (e) {
      // Handle error, show toast or dialog
    }
  }

  @override
  Widget build(BuildContext context) {
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
          padding: const EdgeInsets.fromLTRB(27, 30, 0, 27),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () async {
                    String imageUrl = await pickImageFromGallery();
                    log('Image URL: $imageUrl');
                  },
                  child: CircleAvatar(
                    radius: 60,
                    backgroundImage: NetworkImage(placeholderImage),
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: addProperty,
                  decoration: const InputDecoration(
                    labelText: "Property Title",
                    labelStyle: TextStyle(color: black),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: black),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: deepBlue),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: addDescription,
                  maxLines: 4,
                  decoration: const InputDecoration(
                    labelText: "Property Description",
                    labelStyle: TextStyle(color: black),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: black),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: deepBlue),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: addAmount,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: "Amount",
                    labelStyle: TextStyle(color: black),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: black),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: deepBlue),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () async {
                    String imageUrl = await uploadImageToStorage(photo);
                    String propertyTitle = addProperty.text;
                    String propertyDescription = addDescription.text;
                    String amount = addAmount.text;
                    await savePropertyToFirestore(
                        imageUrl, propertyTitle, propertyDescription, amount);
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AddedByYou()));
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 60),
                    child: Text(
                      "Add Property",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
