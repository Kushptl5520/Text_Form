import 'package:flutter/material.dart';
import 'package:text_form_ui/form_1.dart';
import 'package:text_form_ui/routes/routes.dart';

import 'home_page.dart';

void main(List<String> args) {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      routes: {
        "/": (context) => const Form1(),
        MyRoutes.formRoute: (context) => const Form1(),
        MyRoutes.homeRoute: (context) => const HomePage(),
      },
    );
  }
}