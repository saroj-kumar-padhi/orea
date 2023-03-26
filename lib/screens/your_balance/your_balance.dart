import 'package:flutter/material.dart';
import '../../common_utils/common_utils.dart';
class YourBalance extends StatelessWidget {
  const YourBalance({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: BoldText("YOUR BALANCE", deepGreer, 18),
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
          padding: const EdgeInsets.fromLTRB(24, 20, 24, 30),
          child: Column(
            children: [
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BoldText("Available Balance: ", deepGreer, 15),
                  LightText("PKR 90,897,428", deepBlue, 15)
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BoldText("Taxes & commission", deepGreer, 15),
                  LightText("PKR 97,428.00", deepBlue, 15)
                ],
              ),
              const SizedBox(height: 26),
              const Divider(color: hint),
              const SizedBox(height: 26),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BoldText("Total AMOUNT", deepGreer, 15),
                  LightText("PKR 97,428.00.0", deepBlue, 15)
                ],
              ),
              const Spacer(),
              MaterialButton(
                elevation: 0.0,
                color: deepBlue,
                height: 40,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                minWidth: MediaQuery.of(context).size.width,
                onPressed: () {},
                child: BoldText("Withdraw", whiteColor, 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
