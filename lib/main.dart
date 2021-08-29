import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'home_tab.dart';
import 'login.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  // const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),

    );
  }
}

//make a splash screen and call it first
//check in the splash screen weather user is logged in or not
// then navigate the user accordingly
class SplashScreen extends StatefulWidget {
  // const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isLogedIn = false;
  void initState() {
    autoLogin();
    super.initState();
    Timer(Duration(seconds: 5),
            () {
      if(isLogedIn){
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
                Home()
            )
        );
      }
      if(!isLogedIn){
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
                LogIn()
            )
        );
      }

          }
    );
  }
   autoLogin() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var email = prefs.getString('email');
    var password = prefs.getString('password');
    if(email==null||password==null){
      setState(() {
        isLogedIn=false;
      });
    }
    if(email!=null&&password!=null){
      // Future<void> login(email,password) async{
        http.Response response = await http.post('https://reqres.in/api/login',
            body: {
              "email": //email,
              "eve.holt@reqres.in",
              "password": //password,
              "pistol",
            }
        );
        if(response.statusCode==200){
          print('api logged in successfully');
          var data  =  json.decode(response.body);
          print(data.toString());
          setState(() {
            isLogedIn=true;
          });
          // Navigator.push(context,
          //     MaterialPageRoute(builder: (context) => Home()));
        }
        else{
          print('api calling failed  status code is ${response.statusCode}');
          setState(() {
            isLogedIn=false;
          });


        }

      // }
    }

    //this will return true or false
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child:FlutterLogo(size:MediaQuery.of(context).size.height/2)
    );
  }
}
