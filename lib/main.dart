import 'package:Orea/screens/orea_real_estate_bidding/orea_real_estate_bidding.dart';
import 'package:Orea/screens/welcome_screen/welcome_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:Orea/screens/splash_screen/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const CheckUser());
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return CheckUser();
//   }
// }

class CheckUser extends StatefulWidget {
  const CheckUser({super.key});

  @override
  State<CheckUser> createState() => _CheckUserState();
}

class _CheckUserState extends State<CheckUser> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Online Real Estate Application',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //  initialRoute: '/',
      // routes: {
      //   '/': (context) => SplashScreen(),
      //   '/welcome': (context) => WelcomeScreen(),
      //   '/home': (context) => HomeScreen(),
      // },
      home: const SplashScreen(),
    );
  }
}
