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
  final _formKey = GlobalKey<FormState>();

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
          padding: const EdgeInsets.fromLTRB(27, 30, 27, 0),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
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
                      GestureDetector(
                        onTap: () async {
                          String imageUrl = await pickImageFromGallery();
                          log('Image URL: $imageUrl');
                        },
                        // backgroundImage: NetworkImage(placeholderImage),
                        child: Container(
                          height: 100,
                          width: 150,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: whiteColor,
                              border: Border.all(width: 1, color: deepBlue)),
                          child: placeholderImage == null
                              ? const Icon(
                                  Icons.add,
                                  color: deepBlue,
                                  size: 30,
                                )
                              : ClipRRect(
                                  child: Container(
                                    height: 100,
                                    width: 150,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      image: DecorationImage(
                                          image: NetworkImage(
                                            placeholderImage,
                                          ),
                                          fit: BoxFit.cover),
                                    ),
                                  ),
                                ),
                        ),
                      ),
                      const SizedBox(width: 15),
                      Row(
                        children: [
                          BoldText("Select Image", deepBlue, 15),
                          BoldText("*", Colors.red, 15),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 30),
                  Row(
                    children: [
                      BoldText("Add property Tilte", deepBlue, 15),
                      BoldText("*", Colors.red, 15),
                    ],
                  ),
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
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your title';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 30),
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
                  Row(
                    children: [
                      BoldText("Add amount", deepBlue, 15),
                      BoldText("*", Colors.red, 15),
                    ],
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: addAmount,
                    keyboardType: const TextInputType.numberWithOptions(),
                    decoration: InputDecoration(
                      fillColor: whiteColor,
                      filled: true,
                      contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(color: deepBlue)),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your price';
                      }
                      return null;
                    },
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
                        if (_formKey.currentState!.validate()) {
                          String imageUrl = await uploadImageToStorage(photo);
                          String propertyTitle = addProperty.text;
                          String propertyDescription = addDescription.text;
                          String amount = addAmount.text;
                          await savePropertyToFirestore(imageUrl, propertyTitle,
                              propertyDescription, amount);
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AddedByYou(),
                            ),
                          );
                        }
                      },
                      child: BoldText("Add Property", whiteColor, 18)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
