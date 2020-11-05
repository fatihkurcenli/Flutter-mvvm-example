import 'package:flutter/material.dart';

import 'json_place_holder_viewModel.dart';

class JsonPlaceHolderView extends JsonPlaceHolderViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: isLoading
            ? CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white))
            : Text("Jsonplaceholder"),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () => getPost()),
      body: ListView.builder(
          itemCount: postModel.length,
          itemBuilder: (context, index) => Card(
                child: ListTile(
                  title: Text(postModel[index].title),
                  subtitle: Text(postModel[index].body),
                  leading: Text(postModel[index].id.toString()),
                ),
              )),
    );
  }
}
