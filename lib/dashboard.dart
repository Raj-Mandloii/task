import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';

class DashBoard extends StatefulWidget {
  // const DashBoard({Key? key}) : super(key: key);

  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        appBar: AppBar(
          toolbarHeight: 85,
          backgroundColor: Colors.white,
          elevation: 0,
          automaticallyImplyLeading: false,
          leading: SvgPicture.asset('images/icons/fourdot.svg'),
          title: Text(
            'Home',
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.w700, color: Colors.black),
          ),
          actions: [
            Icon(
              Icons.search,
              color: Colors.black,
            ),
            SizedBox(
              width: 20,
            ),
            CircleAvatar(
               radius: 20,
              backgroundImage: AssetImage('images/dummy.png'),
            ),
            SizedBox(
              width: 20,
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.only(left:15.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Feature Articles',
                style: TextStyle(fontSize: 25,fontWeight: FontWeight.w800),
              ),
              SizedBox(height: 25,),
              Container(
                  height: 350,
                  child: ListView.builder(
                      itemCount: 20,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.only(top:8,bottom: 8,right: 10),
                          // height: 10,
                          width: 180,
                          // color: Colors.red,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            image: DecorationImage(
                                image: AssetImage('images/fit.jpg'),
                                fit: BoxFit.cover),
                            color: Colors.blue,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              index != 0
                                  ? Card(
                                      margin: EdgeInsets.all(0),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                            bottomRight: Radius.circular(12)),
                                      ),
                                      color: Colors.blue,
                                      child: Padding(
                                        padding: EdgeInsets.all(10),
                                        child: Icon(Icons.favorite),
                                      ))
                                  : Card(),
                              Card(
                                margin: EdgeInsets.all(0),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                color: Colors.blue,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      '5 Minutes of daily yoga,\nlifetime of Strength',
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.white,
                                          wordSpacing: 1.2,
                                          height: 1.6,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          'READ NOW',
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.white,
                                              wordSpacing: 1.2,
                                              height: 1.6,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        CircleAvatar(
                                          radius: 15,
                                          backgroundColor: Colors.white,
                                          child: index == 1
                                              ? Icon(
                                                  Icons.star,
                                                  color: Colors.blue,
                                                )
                                              : Icon(
                                                  Icons.star,
                                                  color: Colors.grey.shade400,
                                                ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      })),
              SizedBox(
                height: 45,
              ),
              Text(
                'Feature Videos',
                style: TextStyle(fontSize: 25,fontWeight: FontWeight.w800),
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                  height: 220,
                  child: ListView.builder(
                      itemCount: 20,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.only(top:8,bottom: 8,right: 10),
                          // height: 10,
                          width: 250,
                          // color: Colors.red,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            image: DecorationImage(
                                image: AssetImage('images/fit.jpg'),
                                fit: BoxFit.cover),
                            color: Colors.blue,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Card(
                                  margin: EdgeInsets.all(0),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(12)),
                                  ),
                                  color: Colors.blue,
                                  child: Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Text('00:01:59',style: TextStyle(color: Colors.white),)
                                  )),
                              Padding(
                                padding: const EdgeInsets.only(bottom:8,left: 15),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    CircleAvatar(
                                      radius: 15,
                                      backgroundColor: Colors.white,
                                      child: index == 0
                                          ? Icon(
                                        Icons.star,
                                        color: Colors.blue,
                                      )
                                          : Icon(
                                        Icons.star,
                                        color: Colors.grey.shade400,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      })),
            ],
          ),
        ),
    
    );
  }
}
