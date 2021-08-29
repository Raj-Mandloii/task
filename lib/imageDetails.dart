import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class ImageDetails extends StatefulWidget {
   ImageDetails({this.url});
  String url;
  @override
  _ImageDetailsState createState() => _ImageDetailsState();
}

class _ImageDetailsState extends State<ImageDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.network('${widget.url}',fit: BoxFit.cover,
        ),
      ),
    );
  }
}
