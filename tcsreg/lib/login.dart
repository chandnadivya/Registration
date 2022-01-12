
import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:firebase_database/firebase_database.dart';


class MyLogin extends StatefulWidget {
  String event;
  MyLogin({
    Key? key,
    required this.event,
  }) : super(key: key);

  @override
  _MyLoginState createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {

  TextEditingController nameController=TextEditingController();
  TextEditingController emailController=TextEditingController();
  TextEditingController phoneController=TextEditingController();
  TextEditingController teamnameController=TextEditingController();

  final _Key=GlobalKey<FormState>();
  DatabaseReference dbRef= FirebaseDatabase.instance.reference().child("Registration");
  String Email ="";
  String phone = "";


  @override
  void initState() {
    super.initState();
    getPrefilledValues();
  }
  getPrefilledValues() async{
    setState(() {
      emailController.text = Email;
      phoneController.text = phone;
    });
    }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/image3.jpg'), fit: BoxFit.cover),
      ),
      child:Scaffold(
        backgroundColor: Colors.transparent,
        body:Stack(
          children:[
            Container(
              padding: EdgeInsets.only(left: 115,top: 100),
              child: Text(
                'Registration',
                style:TextStyle(color:Colors.white,fontSize: 33),
              ),
            ),

            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height *0.3,
                  right: 35,
                  left: 35),

                child:Column(
                  children:[
                    TextField(
                      controller: nameController,
                      decoration: InputDecoration(

                        prefixIcon: Icon(
                          Icons.account_circle_outlined,
                          color: Color(0xFF263238),
                        ),
                        fillColor: Colors.white,
                        filled: true,
                        hintText: 'Name',
                        border:OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                        ),

                      ),
                    SizedBox(
                      height: 30,
                    ),
                    TextField(
                      controller: emailController,
                      readOnly: false,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.email_outlined,
                          color: Color(0xFF263238),
                        ),
                        fillColor: Colors.white,
                        filled: true,
                        hintText:'Loading...', //'Email',
                        border:OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      autofillHints: [AutofillHints.email],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TextField(
                      autofillHints: [AutofillHints.telephoneNumber],
                      controller: phoneController,
                      readOnly: false,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.phone,
                          color: Color(0xFF263238),
                        ),
                        fillColor:Colors.white,
                        filled: true,
                        hintText: 'Loading...', //'Enter Phone Number',
                        border:OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TextField(
                      controller: teamnameController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.accessibility_new,
                          color: Color(0xFF263238),
                        ),
                        fillColor: Colors.white,
                        filled: true,
                        hintText: 'Enter Teams Name',
                        border:OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    RaisedButton(
                      shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(10) ),
                      padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0),
                      key: _Key,
                      color: Colors.white,
                      child:Text('Register'),
                      onPressed: () async {
                        await dbRef.child(phoneController.text).set({
                          "email": emailController.text,
                          "name": nameController.text,
                          "phone": phoneController.text,
                          "team's name": teamnameController.text,
                        });
                      },

                    ),

                  ],
                ),
              ),

            ),

              ],
        ),
      )
    );
  }
}



