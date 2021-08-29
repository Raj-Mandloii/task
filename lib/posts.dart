import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hacker_kernel/postDetails.dart';
import 'package:http/http.dart' as http;

class Posts extends StatefulWidget {
  // const Posts({Key? key}) : super(key: key);

  @override
  _PostsState createState() => _PostsState();
}

class _PostsState extends State<Posts> {
  var data;
  var isLoading = true;
  Future<void> getPosts() async{
    http.Response response = await http.get('https://jsonplaceholder.typicode.com/posts');
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
    getPosts();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: !isLoading?Padding(
        padding: const EdgeInsets.only(left:15,top: 15,right: 15),
        child: ListView.builder(
            // gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            //     maxCrossAxisExtent: 200,
            //     childAspectRatio: 3 / 2,
            //     crossAxisSpacing: 20,
            //     mainAxisSpacing: 20),
            itemCount: data.length,
            itemBuilder: (BuildContext ctx, index) {
              return Container(
                height: 100,
                margin: EdgeInsets.all(8),
                alignment: Alignment.center,
                child: ListTile(
                  title: Text('${data[index]['title']}'),
                  subtitle: Text('${data[index]['body']}'),
                  leading: Text('${data[index]['id']}'),
                  onTap: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder:
                            (context) =>
                            Postdetails(postId: data[index]['id'].toString(),)
                        )
                    );
                  },
                ),
                decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(15)),
              );
            }),
      ):Center(child: CircularProgressIndicator(),),
    );
  }
}
