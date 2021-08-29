import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'imageDetails.dart';


class Photos extends StatefulWidget {
  // const Photos({Key? key}) : super(key: key);

  @override
  _PhotosState createState() => _PhotosState();
}

class _PhotosState extends State<Photos> {
  var data;
  var isLoading = true;
  Future<void> getImages() async{
    http.Response response = await http.get('https://jsonplaceholder.typicode.com/photos');
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
    getImages();
    super.initState();
  }
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      body: !isLoading?Padding(
        padding: const EdgeInsets.only(left:15,top: 15,right: 15),
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20),
            itemCount: data.length,
            itemBuilder: (BuildContext ctx, index) {
              return GestureDetector(
                onTap: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder:
                          (context) => ImageDetails(url: data[index]['url'].toString(),)
                      )
                  );
                },
                child: Container(
                  alignment: Alignment.center,
                  // child: Text('${data[index]['title']}',textAlign: TextAlign.center,),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                       image: NetworkImage('${data[index]['url']}'),fit: BoxFit.cover
                    ),
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(15)),
                ),
              );
            }),
      ):Center(child: CircularProgressIndicator(),),
    );
  }
}
