import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onlineshopping/Ui%20Pages/signup_page.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final space =  SizedBox(
    height: 10,
  );
  final spacee =  SizedBox(
    height: 25,
  );
   bool items = false ;
    String changinValue = "" ;
  bool eye = true;
 final _formkey = GlobalKey<FormState>();
 TextEditingController _emailController = TextEditingController();
 TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.only(left: 19.0, right: 19),
        child: Form(
          onChanged: (){
            setState(() {
            items   = _formkey.currentState!.validate();
            });
          },
          key:_formkey ,
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints){
              return SingleChildScrollView(
                child: ConstrainedBox(constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child:  Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height/4.1,
                    ),
                    Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Online Shopping",
                          style:
                          GoogleFonts.aclonica(color: Colors.white, fontSize: 30),
                        )),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _emailController,
                      validator: (value){
                        if( value == null  || value.isEmpty){
                          return "Email";
                        }else{
                          return null;
                        }
                      },
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          hintText: "Email",
                          hintStyle: TextStyle(color: Colors.white),
                          filled: true,
                          fillColor: Colors.grey[800],
                          labelText: "Email",
                          labelStyle: TextStyle(color: Colors.white)),
                    ),
                    space,
                    TextFormField(

                      controller: _passwordController,
                      validator: (value){
                        if( value == null  || value.isEmpty){
                          return "Password";
                        }else{
                          return null;
                        }
                      },
                      style: TextStyle(color: Colors.white),
                      obscureText: eye,
                      decoration: InputDecoration(
                        // suffixIcon: Icon(Icons.remove_red_eye),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                eye = !eye;
                              });
                            },
                            icon: Icon(eye
                                ? FontAwesomeIcons.eyeLowVision
                                : Icons.remove_red_eye),
                            iconSize: 20,color: Colors.blueGrey,
                          ),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          hintText: "Password",
                          hintStyle: TextStyle(color: Colors.white),
                          filled: true,
                          fillColor: Colors.grey[800],
                          labelText: "Password",
                          labelStyle: TextStyle(color: Colors.white)),
                    ),
                    space,
                    SizedBox(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height*.06,
                        child: TextButton(
                          onPressed: () {
                            _formkey.currentState!.validate();
                          },
                          child: Text(
                            "Log in",
                            style: TextStyle(color: Colors.white),
                          ),
                          style: TextButton.styleFrom(backgroundColor:

                          //changinValue == null || changinValue.isNotEmpty ?

                          items ? Colors.blue :Colors.blueGrey  ),
                        )),
                    spacee,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Forgot your login details?",style: TextStyle(color: Colors.grey),),
                        Text(" Get help logging in.",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)
                      ],
                    ),
                    spacee,
                    Row(
                        children: <Widget>[
                          Expanded(
                            child: Divider(
                              color: Colors.grey,
                              //thickness: 5,
                            ),
                          ),

                          Text(" OR ",style: TextStyle(color: Colors.white),),

                          Expanded(
                              child: Divider(
                                color: Colors.grey,
                                //thickness: 5,
                              )
                          ),
                        ]
                    ),
                    spacee,
                    GestureDetector(
                      onTap: ()async{
                        await launch('https://www.facebook.com/login/');
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(FontAwesomeIcons.facebook,color: Colors.blue,),
                          Text("Log in with Facebook",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),)
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height*.17,

                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Divider(
                        //   color: Colors.grey,
                        // ),

                        Text("Don't have an account?  ",style: TextStyle(color: Colors.grey),),
                        GestureDetector(
                            onTap: (){
                              Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>SignUpPage()));
                            },
                            child: Text("Sign up",style: TextStyle(color: Colors.white),))
                      ],
                    )

                  ],
                ),
                ),
              );
            }

          ),

        ),
      ),
    );
  }
  btnWork(){

  }
}
