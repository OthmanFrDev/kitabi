import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kitabi_app/screens/books.dart';
import 'package:kitabi_app/screens/genres.dart';
import 'package:kitabi_app/screens/sign_in.dart';
import 'package:kitabi_app/screens/welcome_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Book Finder',
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
        ),
        getPages: [
          GetPage(
              name: "/",
              page: () => WelcomeScreen(),
              transition: Transition.fadeIn),
          GetPage(
              name: "/genres",
              page: () => Genres(),
              transition: Transition.rightToLeftWithFade),
          GetPage(
              name: "/books",
              page: () => Books(),
              transition: Transition.rightToLeftWithFade),
        ],
        initialRoute: "/"
        // home: DropDownDemo(),
        );
  }
}
