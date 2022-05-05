import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:onlineshopping/Painter%20class/painter_class.dart';
import 'package:onlineshopping/Ui%20Pages/login_page.dart';

class SignUpPage extends StatefulWidget {
   SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
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
  File? imageCamera;
  File? imageGallery;

  TextEditingController _emailController = TextEditingController();

  TextEditingController _passwordController = TextEditingController();
  TextEditingController _fullnameController = TextEditingController();
  TextEditingController _confirmPassword = TextEditingController();


  Future pickImage(ImageSource source)async{
    try {
      final camera = await ImagePicker().pickImage(source: source);
      if (camera == null) return;
      final imageTemporary = File(camera.path);
      setState(() {
        this.imageCamera = imageTemporary;
      });
    }on PlatformException catch(e){
      print("failed to pick image $e ");
    }

  }





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
            child: LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints){
          return SingleChildScrollView(
            child: ConstrainedBox(constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height/7.9,
                ),

                Align(
                    alignment: Alignment.center,
                    child: CustomPaint(
                       // foregroundPainter: Circle(),
                      painter: Circle(),
                        child: GestureDetector(

                            onTap: (){
                                showModalBottomSheet(context: context, builder: (ctx){
                                  return Container(
                                    color: Colors.black
                                    ,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        ListTile(
                                          leading: CircleAvatar(
                                            backgroundColor: Colors.white,
                                            radius : 20,
                                            child: IconButton(
                                                onPressed: (){
                                                  //print("tapped");
                                                  pickImage(ImageSource.gallery);
                                                },
                                               icon:Icon( FontAwesomeIcons.fileImage)),
                                          ),
                                          title: Text("Pick Gallery",style: TextStyle(color: Colors.white),),
                                        ),
                                        ListTile(
                                          leading: CircleAvatar(
                                            backgroundColor: Colors.white,
                                            radius : 20,
                                            child: IconButton(
                                                onPressed: (){
                                                  //print("tapped");
                                                  pickImage(ImageSource.camera);
                                                },
                                                icon:Icon( FontAwesomeIcons.cameraRetro)),
                                          ),
                                          title: Text("Pick Camera",style: TextStyle(color: Colors.white),),
                                        ),
                                      ],
                                    ),
                                  );
                                });
                            },
                            child: imageCamera != null ? Container(
                              width: 150,
                                height: 150,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(image:FileImage(imageCamera!),fit: BoxFit.fill )
                                ),
                                ): Icon(Icons.person,size: MediaQuery.of(context).size.height*.2,color: Colors.white,)))),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _fullnameController,
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
                          borderSide: BorderSide(color: Colors.black)),
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
                TextFormField(

                  controller: _confirmPassword,
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
                      hintText: "Confirm Password",
                      hintStyle: TextStyle(color: Colors.white),
                      filled: true,
                      fillColor: Colors.grey[800],
                      labelText: "Confirm Password",
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
                SizedBox(
                  height: MediaQuery.of(context).size.height*.17,

                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Divider(
                    //   color: Colors.grey,
                    // ),

                    Text("Already have an account? ",style: TextStyle(color: Colors.grey),),
                    GestureDetector(
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>LoginPage()));
                        },
                        child: Text("Log in",style: TextStyle(color: Colors.white),))
                  ],
                )


              ],
            ),
            ),
          );
        })),
      ),
    );
  }
}
