import 'package:flutter/material.dart';
import 'package:mvvm_example/jsonplaceholder/json_place_holder.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      home: JsonPlaceHolder(),
    );
  }
}
