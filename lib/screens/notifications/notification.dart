import 'package:Orea/common_utils/image_paths.dart';
import 'package:flutter/material.dart';
import '../../common_utils/common_utils.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: whiteColor,
        title: BoldText("Notifications", deepGreer, 18),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_outlined,
            color: deepGreer,
          ),
        ),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            children: [
              const SizedBox(height: 10),
              notifications(ImagePath.house, "New properties added",
                  "Check new properties for rent"),
              const SizedBox(height: 18),
              notifications(ImagePath.logo, "OREA new offers",
                  "Check out amazing offers on new properties")
            ],
          ),
        ),
      ),
    );
  }

  Widget notifications(String image, String title, String subtitle) {
    return Container(
      height: 70,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [BoxShadow(color: hint, spreadRadius: 1)]),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            const SizedBox(width: 7),
            CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage(image),
            ),
            const SizedBox(width: 18),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 4),
                BoldText(title, Colors.black54, 14),
                LightText(subtitle, deepBlue, 12),
              ],
            )
          ],
        ),
      ),
    );
  }
}
