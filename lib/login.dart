import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'home_tab.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'home_tab.dart';



class LogIn extends StatefulWidget {
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  var data;
  var isLoading = false;
  Future<void> login(email,password) async{
    http.Response response = await http.post('https://reqres.in/api/login',
      body: {
        "email": email.toString().trim(),
        // "eve.holt@reqres.in",
        "password": password.toString().trim(),
        // "pistol",
      }
    );
    if(response.statusCode==200){
//share
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('email', email);
      prefs.setString('password', password);

      print('api logged in successfully');
      data  =  json.decode(response.body);
      print(data.toString());
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder:
              (context) =>
              Home()
          )
      );
    }

    else{
      print('api calling failed  status code is ${response.statusCode}');
      setState(() {
        isLoading=false;
      });

    }

  }
  final _formkey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool show = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 15, right: 15, top: 250, bottom: 90),
              child: Card(
                borderOnForeground: true,
                elevation: 5,
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 25, right: 25, top: 95, bottom: 0),
                  child: Form(
                    key: _formkey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Text(
                            'Login',
                            style: TextStyle(fontSize: 30),
                          ),
                        ),
                        SizedBox(height: 65),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 15, right: 10, bottom: 10),
                          child: TextFormField(
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                            autofocus: false,
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.email),
                              hintText: 'Email',
                              focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(15.0)),
                                  borderSide: BorderSide(color: Colors.grey)),
                              contentPadding:
                              EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0)),
                            ),
                            validator: (v){
                              if(v.contains('@')&&v.length>8){
                                return null;
                              }
                              else{
                                return 'Please enter correct email';
                              }

                            },
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15, right: 10),
                          child: TextFormField(
                            controller: passwordController,
                            validator: (v){
                              if(v.length>5){
                                return null;
                              }
                              else{
                                return 'Please enter correct Password';
                              }

                            },
                            autofocus: false,
                            obscureText: show,
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.lock),
                              suffixIcon: IconButton(
                                icon: !show ? Icon(Icons.visibility):Icon(Icons.visibility_off),
                                onPressed: (){
                                  setState(() {
                                    show=!show;
                                  });
                                },
                              ),
                              hintText: 'Enter Password',
                              focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(15.0)),
                                  borderSide: BorderSide(color: Colors.grey)),
                              contentPadding:
                              EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0)),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isLoading=true;
                            });
                            if(_formkey.currentState.validate()){
                              login(emailController.text, passwordController.text);
                            }
                            else{
                              print('not validate');
                              setState(() {
                                isLoading=false;
                              });

                            }

                          },
                          child: Center(
                            child: isLoading==false?Card(
                              color: Colors.blue,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 40, right: 43, top: 10, bottom: 10),
                                child: Text(
                                  'LogIn',
                                  style: TextStyle(fontSize: 20,color: Colors.white),),
                                ),
                              ):CircularProgressIndicator(),
                            ),
                          ),

                        SizedBox(
                          height: 50,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
