import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mvvm_example/model/post_model.dart';
import 'json_place_holder.dart';

abstract class JsonPlaceHolderViewModel extends State<JsonPlaceHolder> {
  final baseUrl = "https://jsonplaceholder.typicode.com";
  List<PostModel> postModel = [];
  bool isLoading = false;

  Future<void> getPost() async {
    changeLoading();
    final response = await http.get("$baseUrl/posts");

    switch (response.statusCode) {
      case HttpStatus.ok:
        final jsonBody = jsonDecode(response.body);
        if (jsonBody is List) {
          postModel = jsonBody
              .map((e) => PostModel.fromJson(e))
              .toList()
              .cast<PostModel>();
        }
        break;
      default:
        showDialog(
            context: context,
            builder: (context) => Dialog(child: Text("There's no data")));
    }
    changeLoading();
  }

  void changeLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }
}
