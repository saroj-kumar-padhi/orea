import 'package:flutter/material.dart';

import '../../common_utils/common_utils.dart';
import '../orea_real_estate_bidding/orea_real_estate_bidding.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String months = 'Option 1';
  String year = 'Option A';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: BoldText("PAYMENT", deepGreer, 18),
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
          padding: const EdgeInsets.fromLTRB(24, 30, 24, 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BoldText("Credit / Debit / ATM Card", deepBlue, 13),
              const SizedBox(height: 9),
              TextFormField(
                autofocus: false,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  fillColor: whiteColor,
                  filled: true,
                  contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                  hintText: "Enter Card Number",
                  hintStyle: const TextStyle(
                      fontFamily: "Poppins", color: hint, fontSize: 15),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: deepBlue)),
                ),
              ),
              const SizedBox(height: 25),
              Row(
                children: [
                  SizedBox(
                    width: 230,
                    child: TextFormField(
                      autofocus: false,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        suffixIcon:
                            const Icon(Icons.arrow_drop_down, color: hint),
                        suffixText: "MM",
                        fillColor: whiteColor,
                        filled: true,
                        contentPadding:
                            const EdgeInsets.fromLTRB(20, 15, 20, 15),
                        hintText: "Valid thru",
                        hintStyle: const TextStyle(
                            fontFamily: "Poppins", color: hint, fontSize: 15),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(color: deepBlue),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  SizedBox(
                    width: 100,
                    child: TextFormField(
                      autofocus: false,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        fillColor: whiteColor,
                        filled: true,
                        contentPadding:
                            const EdgeInsets.fromLTRB(20, 15, 20, 15),
                        hintText: "CVV",
                        hintStyle: const TextStyle(
                            fontFamily: "Poppins", color: hint, fontSize: 15),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(color: deepBlue)),
                      ),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              MaterialButton(
                elevation: 0.0,
                height: 40,
                minWidth: MediaQuery.of(context).size.width,
                color: deepBlue,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RealEstateBidding(),
                    ),
                  );
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: BoldText("Pay Now", whiteColor, 18),
              )
            ],
          ),
        ),
      ),
    );
  }
}
