import 'package:firebase_10_31_22/views/dashboard.dart';
import 'package:firebase_10_31_22/views/home_page.dart';
import 'package:firebase_10_31_22/views/login.dart';
import 'package:firebase_10_31_22/views/record.dart';
import 'package:firebase_10_31_22/views/singup.dart';
import 'package:firebase_10_31_22/views/splash_screen.dart';
import 'package:firebase_10_31_22/views/verifypage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum Options { search, upload, copy, exit }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/intro_Screen',
      getPages: <GetPage>[
        GetPage(name: '/intro_Screen', page: () => SplashScreen()),
        GetPage(name: '/v', page: () => verifyPage()),
        GetPage(name: '/login', page: () => Login()),
        GetPage(name: '/sign_Up', page: () => SignUp()),
        GetPage(name: '/home_page', page: () => HomePage()),
        GetPage(name: '/dashboard', page: () => Dashboard()),
        GetPage(name: '/intro_Screen', page: () => SplashScreen()),
        GetPage(name: '/record', page: () => Record()),
      ],
    ),
  );
}
