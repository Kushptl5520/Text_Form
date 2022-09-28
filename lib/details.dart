import 'package:flutter/material.dart';

class Details extends StatelessWidget {
  String name, lastname,email;

  Details({required this.name,required this.lastname, required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Profile"),
        ),
        body: Column(
          children: [
            Text('Name: ${name}'),
            Text('LastName: ${lastname}'),
            Text('Email: ${email}'),
          ],
        ));
  }
}
