import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(
    MaterialApp(
      home: BlogApp(),
    )
  );
}

class BlogApp extends StatefulWidget {
  @override
  _BlogAppState createState() => _BlogAppState();
}

class _BlogAppState extends State<BlogApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
