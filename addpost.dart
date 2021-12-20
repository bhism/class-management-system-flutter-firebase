import 'posts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'main.dart';

class addnote extends StatelessWidget {
  TextEditingController title = TextEditingController();

  CollectionReference ref = FirebaseFirestore.instance.collection('posts');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          MaterialButton(
            onPressed: () {
              ref.add({
                'title': title.text,
              }).whenComplete(() {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (_) => posts()));
              });
            },
            child: Text(
              "save",
            ),
          ),
        ],
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(border: Border.all()),
                child: TextField(
                  controller: title,
                  expands: true,
                  maxLines: null,
                  decoration: InputDecoration(
                    hintText: 'title',
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
