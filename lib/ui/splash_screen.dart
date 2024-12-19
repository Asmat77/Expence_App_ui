import 'dart:async';

import 'package:expence_app/ui/homepage.dart';
import 'package:expence_app/ui/on_boarding/login_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String prefsCheck="";

  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 3), ()async{
      SharedPreferences prefs=await SharedPreferences.getInstance();
      prefsCheck=prefs.getString("userId") ?? "";

      Widget navigateTo=LogInPage();
      if(prefsCheck!= ""){
        navigateTo=HomePage();
      }
      Navigator.pushReplacement(context,MaterialPageRoute(builder: (_)=>navigateTo));



    });

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(child: SizedBox(child: Image.asset("assets/icons/boxjpg.png"),width: double.infinity,height:double.infinity,)),
    );
  }
}
