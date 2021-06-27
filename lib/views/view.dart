import 'package:flutter/material.dart';

class ViewTodo extends StatelessWidget {
  final String title;
  final String des;
  ViewTodo({Key? key, required this.title, required this.des});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('View Todo'),
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: Row(
          children: [
            Expanded(
              child: Text(title),
            ),
            Expanded(
              child: Text(des),
            ),
          ],
        ),
      ),
    );
  }
}
