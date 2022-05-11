//import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onlineshopping/Ui%20Pages/login_page.dart';
import 'package:onlineshopping/Ui%20Pages/products_page.dart';
import 'package:onlineshopping/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScreenSplash extends StatefulWidget {
  const ScreenSplash({Key? key}) : super(key: key);

  @override
  State<ScreenSplash> createState() => _ScreenSplashState();
}

class _ScreenSplashState extends State<ScreenSplash> {
  @override
  void initState() {
    checkUserLogged();
    // TODO: implement initState
    super.initState();
  }
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
          child: Text("OnlineShopping",style: GoogleFonts.alegreya(color: Colors.white,fontSize: 44),),

          )
        ],
      ),
    );
  }
Future<void>btnAction()async{
    await Future.delayed(Duration(seconds: 4));
    await Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>LoginPage()));
}
Future<void>checkUserLogged()async{
   SharedPreferences _preference = await SharedPreferences.getInstance();
  final _userLoggedIn =  _preference.getBool(KEY_NAME);
   if(_userLoggedIn == null || _userLoggedIn == false){
     btnAction();
   }else{
     Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>ProductsPage()));
   }

}
}
