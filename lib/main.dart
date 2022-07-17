import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_get_alkitab_json/book-model.dart';
import 'package:flutter_get_alkitab_json/book-services.dart';
import 'package:flutter_get_alkitab_json/catatanpage.dart';
import 'package:flutter_get_alkitab_json/data_services.dart';
import 'package:flutter_get_alkitab_json/dataclass.dart';
import 'package:flutter_get_alkitab_json/editprofile.dart';
import 'package:flutter_get_alkitab_json/homepage.dart';
import 'package:flutter_get_alkitab_json/listalkitab.dart';
import 'package:flutter_get_alkitab_json/listcatatan.dart';
import 'package:flutter_get_alkitab_json/listrenungan.dart';
import 'package:flutter_get_alkitab_json/logininput.dart';
import 'package:flutter_get_alkitab_json/loginpage.dart';
import 'package:flutter_get_alkitab_json/mergeayat.dart';
import 'package:flutter_get_alkitab_json/profile.dart';
import 'package:flutter_get_alkitab_json/register.dart';
import 'package:flutter_get_alkitab_json/renunganpage.dart';
import 'package:flutter_get_alkitab_json/searchalkitab.dart';

void main() {
  runApp(const MaterialApp(
    title: "Widget Aplikasi Sementara",
    debugShowCheckedModeBanner: false, 
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MergeAyat(),
    );
  }
}