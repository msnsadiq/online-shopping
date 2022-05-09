import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onlineshopping/Api/login%20api/login_api.dart';
import 'package:onlineshopping/Api/signup%20create%20api/api_signup_create.dart';
import 'package:onlineshopping/BLOC%20login/bloc_login_bloc.dart';
//import 'package:onlineshopping/Api/signup%20create%20api/signup%20api.dart';
import 'package:onlineshopping/BLOC%20signup%20create/bloc_sign_create_bloc.dart';
//import 'package:onlineshopping/BlocSignUpCreate/bloc_sign_bloc.dart';
import 'package:onlineshopping/Ui%20Pages/login_page.dart';
import 'package:onlineshopping/Ui%20Pages/products_page.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({Key? key}) : super(key: key);

  SignUpApi signUpApi = SignUpApi();
  LoginApii loginApii = LoginApii();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (BuildContext context)=> SignCreateBloc(signUpApi)),
      BlocProvider(create: (BuildContext context)=>LoginBloc(loginApii))
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'onlineshopping',
        theme: ThemeData(

         // primarySwatch: Colors.blue,
          errorColor: Colors.blueGrey
        ),
        home:LoginPage() ,
       // home: ProductsPage(),
      ),
    );
  }
}

