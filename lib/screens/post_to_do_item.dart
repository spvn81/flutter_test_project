import 'package:flutter/material.dart';
import 'package:flutter_application_11/models/to_do_model.dart';
import 'package:flutter_application_11/utilities/db_helper.dart';
import 'package:intl/intl.dart';

class PostToDoItem extends StatefulWidget {
  ToDoModel toDoModel;
  String appBarTitle;
  PostToDoItem(this.toDoModel, this.appBarTitle);
  @override
  _PostToDoItemState createState() =>
      _PostToDoItemState(this.toDoModel, this.appBarTitle);
}

class _PostToDoItemState extends State<PostToDoItem> {
  ToDoModel toDoModel;
  String appBarTitle;
  var _statusList = ['Pending', 'completed'];
  var selectedStatus = 'Pending';
  TextEditingController _titleController = TextEditingController();
  TextEditingController _descreptionController = TextEditingController();

  _PostToDoItemState(this.toDoModel, this.appBarTitle);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTitle),
      ),
      body: Container(
        margin: EdgeInsets.all(8),
        padding: EdgeInsets.all(8),
        child: Column(children: [
          DropdownButton(
              value: selectedStatus,
              items: _statusList
                  .map((e) => DropdownMenuItem(
                        child: Text(e),
                        value: e,
                      ))
                  .toList(),
              onChanged: ((value) => setState(() {
                    selectedStatus = value!;
                  }))),
          SizedBox(height: 20),
          TextField(
            controller: _titleController,
            decoration: InputDecoration(
                hintText: "Enter Text Title",
                labelText: "title",
                border: OutlineInputBorder()),
          ),
          SizedBox(height: 20),
          TextField(
            controller: _descreptionController,
            decoration: InputDecoration(
                hintText: "Enter Text Description",
                labelText: "Description",
                border: OutlineInputBorder()),
          ),
          SizedBox(height: 20),
          Container(
            width: double.infinity,
            // child: ElevatedButton(
            //   style: ElevatedButton.styleFrom(primary: Colors.blue),
            //   onPressed: validate(),
            //   child: Text('Submit'),
            // ),
          ),
        ]),
      ),
    );
  }

  validate() {
    toDoModel.title = _titleController.text;
    toDoModel.description = _descreptionController.text;
    toDoModel.status = selectedStatus;
    toDoModel.date = DateFormat.yMMMd().format(DateTime.now());
    DataBaseHelper dataBaseHelper = DataBaseHelper();
    dataBaseHelper.insert(toDoModel);
    Navigator.pop(context, true);
  }
}
