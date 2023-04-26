import 'package:Orea/common_utils/common_utils.dart';
import 'package:Orea/screens/buy_property/buy_property.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class PlaceYourBid extends StatefulWidget {
  String id;
  String imageUrl;
  String discription;
  String amount;
  String propertyTitle;
  PlaceYourBid(
      {Key? key,
      required this.id,
      required this.imageUrl,
      required this.amount,
      required this.discription,
      required this.propertyTitle})
      : super(key: key);

  @override
  State<PlaceYourBid> createState() => _PlaceYourBidState();
}

class _PlaceYourBidState extends State<PlaceYourBid> {
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
    final TextEditingController amountContrller = TextEditingController();
    final TextEditingController amountDescription = TextEditingController();
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: BoldText("PLACE YOUR BID", deepGreer, 18),
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
        child: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(34, 37, 34, 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(
                  widget.imageUrl,
                  height: 185,
                  width: MediaQuery.of(context).size.width,
                ),
                const SizedBox(height: 37),
                Row(
                  children: [
                    BoldText(widget.propertyTitle, deepGreer, 15),
                    const SizedBox(width: 10),
                    BoldText("PKR  ${widget.amount}", deepBlue, 13),
                  ],
                ),
                const SizedBox(height: 8),
                LightText("by Asif Raza | ${user!.email}", deepGreer, 12),
                const SizedBox(height: 8),
                ParagraphText(
                    widget.discription, deepGreer, 15, TextAlign.left),
                const SizedBox(height: 45),
                TextFormField(
                  controller: amountContrller,
                  autofocus: false,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    fillColor: whiteColor,
                    filled: true,
                    contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                    hintText: "enter your amount",
                    hintStyle: const TextStyle(
                        fontFamily: "Poppins", color: hint, fontSize: 15),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(color: deepBlue)),
                  ),
                ),
                const SizedBox(height: 25),
                TextFormField(
                  controller: amountDescription,
                  autofocus: false,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    fillColor: whiteColor,
                    filled: true,
                    contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                    hintText: "any message/offer",
                    hintStyle: const TextStyle(
                        fontFamily: "Poppins", color: hint, fontSize: 15),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(color: deepBlue)),
                  ),
                ),
                const SizedBox(height: 80),
                MaterialButton(
                  color: deepBlue,
                  height: 40,
                  minWidth: MediaQuery.of(context).size.width,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28)),
                  onPressed: () async {
                    // get the document reference for the property
                    final DocumentReference propertyRef =
                        propertiesRef.doc(widget.id);

                    // update the status of the property to approved
                    await propertyRef.update({
                      'bidAmount': amountContrller.text,
                      'bidDescription': amountDescription.text
                    });

                    // rebuild the list view to reflect the updated status
                    setState(() {});

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const BuyProperty()));
                  },
                  child: BoldText("Place Bid", whiteColor, 18),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
