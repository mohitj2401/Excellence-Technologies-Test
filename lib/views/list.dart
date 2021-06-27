import 'package:flutter/material.dart';
import 'package:todo/constants/constant.dart';
import 'package:todo/views/view.dart';

class TodoList extends StatelessWidget {
  const TodoList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Note List'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 35.0),
            child: GestureDetector(
              child: Icon(Icons.add),
            ),
          )
        ],
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        child: ListView.builder(
          itemCount: todos.length,
          itemBuilder: (context, index) {
            return ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ViewTodo(
                            title: todos[index]['title'],
                            des: todos[index]['description'])));
              },
              leading: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Icon(Icons.view_list),
              ),
              title: Text(todos[index]['title']),
              subtitle: Text(todos[index]['description']),
              trailing: Icon(Icons.arrow_forward_ios),
            );
          },
        ),
      ),
    );
  }
}
