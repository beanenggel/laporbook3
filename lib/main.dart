import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'pages/LoginPage.dart';
import 'pages/RegisterPage.dart';
import 'pages/SplashPage.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } catch (e) {
    print('Error initializing Firebase: $e');
    // Handle the error or show a meaningful message to the user.
  }

  runApp(LaporBookApp());
}

class LaporBookApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lapor Book',
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashPage(),
        '/login': (context) => LoginPage(),
        '/register': (context) => const RegisterPage(),
        //'/dashboard': (context) => const DashboardPage(),
        //'/add': (context) => AddFormPage(),
        //'/detail': (context) => DetailPage(),
      },
    );
  }
}
