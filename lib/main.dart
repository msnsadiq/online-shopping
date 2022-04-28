import 'package:flutter/material.dart';
import 'package:onlineshopping/Ui%20Pages/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'onlineshopping',
      theme: ThemeData(

       // primarySwatch: Colors.blue,
        errorColor: Colors.blueGrey
      ),
      home:LoginPage() ,
    );
  }
}

