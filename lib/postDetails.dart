import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Postdetails extends StatefulWidget {
   Postdetails({this.postId});
  String postId;
  @override
  _PostdetailsState createState() => _PostdetailsState();
}

class _PostdetailsState extends State<Postdetails> {
  var data;
  var isLoading = true;
  Future<void> getPostDetail() async{
    http.Response response = await http.get('https://jsonplaceholder.typicode.com/posts/${widget.postId}/');
    if(response.statusCode==200){

      print('api call successfully');
      data  =  json.decode(response.body);
      print(data.toString());
      setState(() {
        isLoading = false;
      });
    }

    else{
      print('api calling failed  status code is ${response.statusCode}');
      setState(() {
        isLoading=true;
      });

    }

  }
  @override
  void initState() {
    getPostDetail();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         title: Text('Post ${widget.postId}'),
      ),
      body: !isLoading?Container(
        margin:const EdgeInsets.only(left:5,top: 100,right: 5),
        padding: const EdgeInsets.only(left:15,top: 15,right: 15),
        height: 300,
        // margin: EdgeInsets.all(8),
        alignment: Alignment.center,
        child: ListTile(
          title: Text('${data['title']}',style: TextStyle(fontSize: 20),),
          subtitle: Text('${data['body']}',style: TextStyle(fontSize: 20),),
          leading: Text('${data['id']}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
        ),
        decoration: BoxDecoration(
            color: Colors.amber,
            borderRadius: BorderRadius.circular(15)),
      ):Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
