import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
   LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
bool eye = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.only(left: 19.0, right: 19),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

          Align(
              alignment: Alignment.center,
              child: Text("Online Shopping",style: GoogleFonts.aclonica(color: Colors.white, fontSize: 30),)),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide:BorderSide(color: Colors.black)
                ),
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                hintText: "Email",
                hintStyle: TextStyle(color: Colors.white),
                filled: true,
                fillColor: Colors.grey[800],
              labelText : "Email",
              labelStyle:   TextStyle(color: Colors.white)
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(

              style: TextStyle(color: Colors.white),
              obscureText: eye,
              decoration: InputDecoration(
               // suffixIcon: Icon(Icons.remove_red_eye),
                 suffixIcon: IconButton(onPressed: (){
                setState(() {
                  eye = !eye;
                });
                 }, icon: Icon(Icons.remove_red_eye)),
                  border: OutlineInputBorder(
                      borderSide:BorderSide(color: Colors.black)
                  ),
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  hintText: "Password",
                  hintStyle: TextStyle(color: Colors.white),
                  filled: true,
                  fillColor: Colors.grey[800],
                  labelText : "Password",
                  labelStyle:   TextStyle(color: Colors.white)
              ),
            ),
          ],
        ),
      ),
    );
  }
}
