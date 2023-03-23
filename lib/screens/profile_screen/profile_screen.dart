
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:orea/common_utils/common_utils.dart';
// import 'package:orea/common_utils/image_paths.dart';
// import 'package:orea/screens/contact_us_screen/contact_us_screen.dart';

// class UserProfileScreen extends StatefulWidget {
//   const UserProfileScreen({Key? key}) : super(key: key);

//   @override
//   State<UserProfile> createState() => _UserProfileState();
// }

// class _UserProfileState extends State<UserProfile> {
 
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: whiteColor,
//       body: Column(
//         mainAxisSize: MainAxisSize.max,
//         children: [
//           const SizedBox(
//             height: 20,
//           ),
//           Row(
//             children: [
//               const Padding(padding: EdgeInsets.all(10)),
//               Container(
//                 height: 70,
//                 width: 70,
//                 decoration: BoxDecoration(
//                     color: hint,
//                     boxShadow:  [
//                       BoxShadow(color: deepGreer, spreadRadius: 1, blurRadius: 1)
//                     ],
//                     borderRadius: BorderRadius.circular(100),
//                     image: DecorationImage(
//                         image: NetworkImage(ImagePath.profile), fit: BoxFit.fill)),
//               ),
//               const SizedBox(
//                 width: 30,
//               ),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
                 
//                 ],
//               ),
//             ],
//           ),
//           const SizedBox(height: 10),
//           const Divider(color: hint),
//           Padding(
//             padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
//             child: Column(
//               children: [
//                 Column(
//                   children: [
//                      Align(
//                         alignment: Alignment.topLeft,
//                         child: BoldText("Phone number", black, 16)),
//                     const SizedBox(
//                       width: 10,
//                     ),
//                     Align(
//                       alignment: Alignment.topLeft,
//                       child: BoldText("fo.phoneNumber",deepBlue, 16),
//                     )
//                   ],
//                 ),
//                 const SizedBox(height: 10),
//                 Column(
//                   children: [
//                      Align(
//                         alignment: Alignment.topLeft,
//                         child: BoldText("fo.phoneNumber",deepBlue, 16),),
//                     const SizedBox(
//                       width: 10,
//                     ),
//                     Align(
//                       alignment: Alignment.topLeft,
//                       child: BoldText("fo.phoneNumber",deepBlue, 16),
//                     )
//                   ],
//                 ),
//               ],
//             ),
//           ),
//           const SizedBox(
//             height: 10,
//           ),
//           Expanded(
//             child: Container(
//               decoration: const BoxDecoration(
//                   color: darkBlue,
//                   borderRadius: BorderRadius.only(
//                       topLeft: Radius.circular(18),
//                       topRight: Radius.circular(18))),
//               child: Padding(
//                 padding: const EdgeInsets.all(18.0),
//                 child: Column(
//                   children: [
//                      Align(
//                       alignment: Alignment.topCenter,
//                       child: BoldText("fo.phoneNumber",deepBlue, 16),
//                     ),
//                     const SizedBox(height: 20),
//                     Row(
//                       children: [
//                         const Icon(Icons.arrow_forward, color: whiteColor, size: 21),
//                         const SizedBox(width: 10),
//                         GestureDetector(
//                           onTap: () {
//                             Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (context) =>
//                                         const ContactUsScreen()));
//                           },
//                           child:  BoldText("Edit your profile", whiteColor, 17),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 10),
//                     Row(
//                       children: [
//                         const Icon(Icons.arrow_forward, color: white, size: 21),
//                         const SizedBox(width: 10),
//                         GestureDetector(
//                           onTap: () {
//                             Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (context) =>
//                                         const EditRemoveProduct()));
//                           },
//                           child:
//                               const BoldFont("View your products", 17, white),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 10),
//                     Row(
//                       children: [
//                         const Icon(Icons.arrow_forward, color: white, size: 21),
//                         const SizedBox(width: 10),
//                         GestureDetector(
//                           onTap: () {
//                             Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (context) =>
//                                         YourCart("25/12/22", "29/1/23")));
//                           },
//                           child: const BoldFont("Billing and rents", 17, white),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 10),
//                     Row(
//                       children: [
//                         const Icon(Icons.arrow_forward, color: white, size: 21),
//                         const SizedBox(width: 10),
//                         BlocConsumer<AuthCubit, AuthState>(
//                           listener: (context, state) {
//                             if (state is AuthLoggedOutState) {
//                               Navigator.popUntil(
//                                   context, (route) => route.isFirst);
//                               Navigator.pushReplacement(
//                                   context,
//                                   CupertinoPageRoute(
//                                       builder: (context) =>
//                                           const WelcomeScreen()));
//                             }
//                           },
//                           builder: (context, state) {
//                             return GestureDetector(
//                                 onTap: () async {
//                                   setState(() {
//                                     _isLogOut = true;
//                                   });
//                                   await Authentication.signOut(
//                                       context: context);
//                                   setState(() {
//                                     _isLogOut = false;
//                                   });
//                                   Navigator.push(
//                                       context,
//                                       MaterialPageRoute(
//                                           builder: (context) =>
//                                               const WelcomeScreen()));
//                                   BlocProvider.of<AuthCubit>(context).logOut();
//                                 },
//                                 child: const BoldFont("Log Out", 17, white));
//                           },
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

// }