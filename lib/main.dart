import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onlineshopping/Api/login%20api/login_api.dart';
import 'package:onlineshopping/Api/product%20id%20api/product_id_api.dart';
import 'package:onlineshopping/Api/product%20read%20api/productread.dart';
import 'package:onlineshopping/Api/signup%20create%20api/api_signup_create.dart';
import 'package:onlineshopping/BLOC%20login/bloc_login_bloc.dart';
import 'package:onlineshopping/BLOC%20product%20id/bloc_product_id_bloc.dart';
import 'package:onlineshopping/BLOC%20product%20read/bloc_produc_read_bloc.dart';
//import 'package:onlineshopping/Api/signup%20create%20api/signup%20api.dart';
import 'package:onlineshopping/BLOC%20signup%20create/bloc_sign_create_bloc.dart';
//import 'package:onlineshopping/BlocSignUpCreate/bloc_sign_bloc.dart';
import 'package:onlineshopping/Ui%20Pages/login_page.dart';
import 'package:onlineshopping/Ui%20Pages/products_page.dart';
import 'package:onlineshopping/Ui%20Pages/screen_splash.dart';
const KEY_NAME = 'user logged in';
void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({Key? key}) : super(key: key);

  SignUpApi signUpApi = SignUpApi();
  LoginApii loginApii = LoginApii();
  ProductRead productRead = ProductRead();
  ApiProductId apiProductId = ApiProductId();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (BuildContext context)=> SignCreateBloc(signUpApi)),
      BlocProvider(create: (BuildContext context)=>LoginBloc(loginApii)),
        BlocProvider(create: (BuildContext context)=>ProducReadBloc(productRead)),
        BlocProvider(create: (BuildContext context)=>ProductIdBloc(apiProductId))
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'onlineshopping',
        theme: ThemeData(

         // primarySwatch: Colors.blue,
          errorColor: Colors.blueGrey
        ),
       // home:LoginPage() ,
       home: ScreenSplash(),
      ),
    );
  }
}

