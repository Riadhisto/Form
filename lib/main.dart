import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:form/Views/loginscreen.dart';
import 'package:form/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Form',
      navigatorKey: navigatorKey,
      home: const LoginScreen(),
    );
  }
}
