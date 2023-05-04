import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:Orea/common_utils/common_utils.dart';



import '../payment_screen/payment_screen.dart';

// ignore: must_be_immutable
class BuyProperty extends StatefulWidget {
  String id;
  String imageUrl;
  String discription;
  String amount;
  String propertyTitle;
  BuyProperty(
      {Key? key,
      required this.id,
      required this.imageUrl,
      required this.amount,
      required this.discription,
      required this.propertyTitle})
      : super(key: key);

  @override
  State<BuyProperty> createState() => _BuyPropertyState();
}

class _BuyPropertyState extends State<BuyProperty> {
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
    final TextEditingController amountContrller = TextEditingController();
    final TextEditingController amountDescription = TextEditingController();
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: BoldText("BUY PROPERTY", deepGreer, 18),
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
          padding: const EdgeInsets.fromLTRB(25, 37, 25, 47),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ClipRRect(
                  child: Container(
                    height: 100,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: deepBlue, width: 1),
                      image: DecorationImage(
                          image: NetworkImage(widget.imageUrl),
                          fit: BoxFit.cover),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 37),
              Row(
                children: [
                  BoldText(widget.propertyTitle, deepGreer, 15),
                  const SizedBox(width: 5),
                  BoldText("PKR ${widget.amount}", deepBlue, 13),
                ],
              ),
              const SizedBox(height: 10),
              LightText("by Asif Raza | ${user!.email}", deepGreer, 12),
              const SizedBox(height: 12),
              ParagraphText(widget.discription, deepGreer, 15, TextAlign.left),
              const Spacer(),
              MaterialButton(
                color: deepBlue,
                height: 40,
                minWidth: MediaQuery.of(context).size.width,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
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
                  // ignore: use_build_context_synchronously
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PaymentScreen()));
                },
                child: BoldText("Proceed to Pay", whiteColor, 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
