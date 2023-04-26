import 'package:Orea/common_utils/common_utils.dart';
import 'package:Orea/common_utils/image_paths.dart';
import 'package:Orea/screens/buy_property/buy_property.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PlaceYourBid extends StatefulWidget {
  String id;
  PlaceYourBid({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  State<PlaceYourBid> createState() => _PlaceYourBidState();
}

class _PlaceYourBidState extends State<PlaceYourBid> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    final CollectionReference propertiesRef = firestore.collection('users');
    final TextEditingController amountContrller = TextEditingController();
    final TextEditingController amountDescription = TextEditingController();
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(34, 37, 34, 10),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    ImagePath.house,
                    height: 185,
                    width: MediaQuery.of(context).size.width,
                  ),
                  const SizedBox(height: 37),
                  Row(
                    children: [
                      BoldText("Property Title", deepGreer, 15),
                      const SizedBox(width: 10),
                      BoldText("PKR  2CR", deepBlue, 13),
                    ],
                  ),
                  const SizedBox(height: 8),
                  LightText("by Asif Raza|asif@gmail.com", deepGreer, 12),
                  const SizedBox(height: 8),
                  ParagraphText(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec in scelerisque velit, a interdum libero. In quis molestie nunc. Pellentesque lacinia pulvinar felis non faucibus. Suspendisse potenti.",
                      deepGreer,
                      15,
                      TextAlign.left),
                  const SizedBox(height: 45),
                  TextFormField(
                    controller: amountContrller,
                    keyboardType: const TextInputType.numberWithOptions(),
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
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your amount*';
                      }
                      return null;
                    },
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
                      if (_formKey.currentState!.validate()) {
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
                      }
                    },
                    child: BoldText("Place Bid", whiteColor, 18),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
