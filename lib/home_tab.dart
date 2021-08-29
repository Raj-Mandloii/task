import 'package:flutter/material.dart';
import 'package:hacker_kernel/login.dart';
import 'package:hacker_kernel/photos.dart';
import 'package:hacker_kernel/posts.dart';
import 'package:hacker_kernel/utils/utils/screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:http/http.dart';
import 'dart:convert';
import 'dart:io';
import 'bottom_nav_bar.dart';
import 'package:http/http.dart' as http;



class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String user = '';
  getUserDetails() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var email = prefs.getString('email');
    await print(email);
    setState(() {
      user = email;
    });
  }
@override
  void initState() {
    getUserDetails();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    ScUtil.init(context, width: 360, height: 640, allowFontScaling: true);

    return DefaultTabController(
        length: 2,
        child: Scaffold(
          drawer: Drawer(
            child: new Column(
              children: <Widget>[
                new UserAccountsDrawerHeader(
                  // accountName: new Text("email"),
                  accountEmail: Text( user!=''?"$user":'eve.holt@reqres.in'),currentAccountPicture: CircleAvatar(
                  backgroundColor:
                  Theme.of(context).platform == TargetPlatform.iOS
                      ? Colors.blue
                      : Colors.white,
                  child: Text(
                    user!=''?"${user[0]}":'e',
                    style: TextStyle(fontSize: 40.0),
                  ),
                ),),
                new Column(children: [
                  ListTile(
                    title: Text('DashBoard'),onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PersistantBottomNav()));
                  },
                  ),
                  ListTile(
                    title: Text('Log Out'),
                    onTap: () async{
                      SharedPreferences prefs = await SharedPreferences.getInstance();
                  prefs.clear();
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder:
                      (context) =>
                          LogIn()
                      ),);

                    },
                  ),
                ]),
              ],
            ),
          ),
          // backgroundColor: Colors.bgcolor,
          appBar: PreferredSize(

            preferredSize: Size.fromHeight(85),
            child: AppBar(
              title: Text('Kernel'),
              backgroundColor: Colors.blue,
              bottom: TabBar(
                indicatorWeight: 4.0,
                indicatorColor: Colors.blue,
                indicatorPadding: EdgeInsets.only(left:8,right:8),
                tabs: [
                  Tab(
                    child: Text(
                      'Photos',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Posts',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),
          body: TabBarView(
            children: [
              Photos(),
              Posts(),
            ],
          ),
        ));
  }
}
