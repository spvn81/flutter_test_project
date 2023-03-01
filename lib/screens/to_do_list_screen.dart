import 'package:flutter/material.dart';
import 'package:flutter_application_11/models/to_do_model.dart';
import 'package:flutter_application_11/screens/post_to_do_item.dart';

class ToDoListScreen extends StatefulWidget {
  @override
  _ToDoListScreenState createState() => _ToDoListScreenState();
}

class _ToDoListScreenState extends State<ToDoListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("To Do List"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // navigationToDetailsView(ToDoModel("", "", "", ""), "Add New Item");
          navigationToDetailsView(ToDoModel("", "", "", ""), "Add New Item");
        },
        child: Icon(Icons.add),
      ),
    );
  }

  navigationToDetailsView(ToDoModel toDoModel, String appBarTitle) async {
    bool result =
        await Navigator.push(context, MaterialPageRoute(builder: (context) {
      return PostToDoItem(toDoModel, appBarTitle);
    }));
    if (result) {
      //update the list
    }
  }
}
