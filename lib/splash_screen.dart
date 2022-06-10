import 'dart:async';
import 'package:flutter/material.dart';
import 'package:run_wheelz/NavigationClasses/profilePage.dart';
import 'package:run_wheelz/dash_board_screen.dart';
import 'package:run_wheelz/new_profile.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login_screen.dart';
class SplashScreen extends StatelessWidget{
  const SplashScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SharedPreferences prefs;
    Timer(
        const Duration(seconds: 3),
            () async =>{
             prefs =  await SharedPreferences.getInstance(),
              if(prefs.getBool('isLogin')==true){
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (BuildContext context) => const NewProfile()))
              }else{
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (BuildContext context) => const LoginScreen()))
            }});
    return   Scaffold(
      body:  Container(
        padding: const EdgeInsets.all(80.0),
        child: const Center(
        child: Image(image: AssetImage('images/mechanic.png')),
      ),)
    );
  }
}