import 'package:flutter/material.dart';
import 'package:formsflutter/screens/register_form_page.dart';


void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Register form Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RegisterFormScreen(),
    );
  }
}