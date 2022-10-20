import 'package:flutter/material.dart';
import 'package:text_form_ui/form_1.dart';
import 'package:text_form_ui/routes/routes.dart';
import 'package:text_form_ui/user_data.dart';
import 'details.dart';
import 'form_2.dart';
import 'home_page.dart';

void main(List<String> args) {
  runApp( MyApp());
}
class MyApp extends StatelessWidget {


   MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: false,
      ),
      routes: {
        "/": (context) => const Form1(),
        MyRoutes.formRoute: (context) =>  Form1(),
        MyRoutes.homeRoute: (context) =>  HomePage(),
        MyRoutes.form2Route : (context) =>  Form2(),
       MyRoutes.detailsRoute : (context) => Details(),

      },
    );
  }
}