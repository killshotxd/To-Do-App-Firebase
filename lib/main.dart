// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:ffi';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
// ignore: non_constant_identifier_names, unused_import
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:logger/Service/Auth_Service.dart';
import 'package:logger/pages/HomePage.dart';
import 'package:logger/pages/SignInPage.dart';
import 'package:logger/pages/SignUpPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  AuthClass authClass = AuthClass();
  Widget currentPage = SignUpPage();

  @override
  void initState() {
    super.initState();
    checkLogin();
  }

  checkLogin() async {
    // ignore: unused_local_variable
    String? token = await authClass.getToken();
    print("token");
    if (token != null) {
      setState(() {
        currentPage = HomePage();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: currentPage,
    );
  }
}
