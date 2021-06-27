import 'package:flutter/material.dart';
import 'package:todo/constants/constant.dart';
import 'package:todo/views/list.dart';

class CreateTodo extends StatefulWidget {
  const CreateTodo({Key? key}) : super(key: key);

  @override
  _CreateTodoState createState() => _CreateTodoState();
}

class _CreateTodoState extends State<CreateTodo> {
  final formKey = GlobalKey<FormState>();
  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();

  updateTodo() {
    if (formKey.currentState!.validate()) {
      todos.add({'title': title.text, 'description': description.text});
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => TodoList()),
          (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Create Todo'),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            child: Form(
                autovalidateMode: AutovalidateMode.always,
                key: formKey,
                child: Container(
                  child: Column(
                    children: [
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter todo title';
                          }

                          return null;
                        },
                        controller: title,
                        decoration: InputDecoration(
                          icon: Icon(
                            Icons.text_fields,
                          ),
                          labelText: "Todo Title",
                        ),
                      ),
                      SizedBox(height: 8),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter todo description';
                          }

                          return null;
                        },
                        controller: description,
                        decoration: InputDecoration(
                          icon: Icon(
                            Icons.text_fields,
                          ),
                          labelText: "Todo Description",
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                          updateTodo();
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.blue,
                          ),
                          padding: EdgeInsets.symmetric(
                              horizontal: 60, vertical: 10),
                          child: Text(
                            'Create',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      )
                    ],
                  ),
                )),
          ),
        ));
  }
}
