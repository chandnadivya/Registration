import 'package:flutter/material.dart';
import 'package:tcsreg/login.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main()  {
  runApp(MaterialApp(

    debugShowCheckedModeBanner: false,
    initialRoute: 'login',
    routes: {'login':(context)=>MyLogin(event:'Codewar')},
  ));
}
