//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onlineshopping/BLOC%20login/bloc_login_bloc.dart';
import 'package:onlineshopping/Ui%20Pages/products_page.dart';
import 'package:onlineshopping/Ui%20Pages/signup_page.dart';
import 'package:onlineshopping/validator/validation.dart';
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
 TextEditingController _nameController = TextEditingController();
 TextEditingController _emailController = TextEditingController();
 TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc,LoginState>(listener:(BuildContext context, state){
      if(state is LoginLoading){
        Center(
          child: CircularProgressIndicator(),
        );
      }
      if(state is LoginLoaded){
        Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>ProductsPage()));
      }
      if(state is LoginCheck){
        showModalBottomSheet(
            context: context,
            builder: (ctx) {
              return Container(
                color: Colors.black,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ListTile(
                      title: Text("Invalid account",style: TextStyle(color: Colors.red),),
                      subtitle: Text("Sorry, we cant't find an account with this\nemailaddress. Please try again or create\na new  account",style: TextStyle(color: Colors.white),),
                      trailing: GestureDetector(
                          onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>SignUpPage()));
                          },
                          child: Text("Sign Up",style: TextStyle(color: Colors.red),)),
                    )
                  ],
                ),
              );
            }
        );
      }
      if(state is LoginError){
        showModalBottomSheet(
            context: context,
            builder: (ctx) {
              return Container(
                color: Colors.black,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                  ListTile(
                    title: Text("Network Error",style: TextStyle(color: Colors.red),),
                    subtitle: Text("something went wrong",style: TextStyle(color: Colors.white),),
                  )
                  ],
                ),
              );
            }
        );
      }

    } ,child: Scaffold(
      backgroundColor: Colors.black,
      body:





      Padding(
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
                          controller: _nameController,
                          validator: (value){
                            if( value == null  || value.isEmpty){
                              return "Full Name";
                            }else{
                              return null;
                            }

                          },
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                              ),
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              hintText: "Full Name",
                              hintStyle: TextStyle(color: Colors.white),
                              filled: true,
                              fillColor: Colors.grey[800],
                              labelText: "Full Name",
                              labelStyle: TextStyle(color: Colors.white)),
                        ),
                        space,
                        TextFormField(
                          controller: _emailController,
                          validator: (value){
                            // if( value == null  || value.isEmpty){
                            //   return "Email";
                            // }else{
                            //   return null;
                            // }
                            return validateEmail(value!);
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
                            }else if(value.length < 6){
                              return "password should be atleast 6 charecters";
                            }

                            else{
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
                                //_formkey.currentState!.validate();
                                _loginBtn();
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
    ),);



  }
_loginBtn(){
    if(_formkey.currentState!.validate()){
     return BlocProvider.of<LoginBloc>(context).add(FetchLogin(userName: _nameController.value.text, userEmail: _emailController.value.text,
         userPassword: _passwordController.value.text));
    }else{
     return print("not valid details");
    }
}
}
