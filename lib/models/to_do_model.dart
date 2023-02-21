class ToDoModel {
  int? id;
  late String title;
  late String description;
  late String status;
  late String date;
  ToDoModel(this.title, this.status, this.date, this.description);
  ToDoModel.withId(
      this.id, this.title, this.status, this.date, this.description);
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = new Map();
    if (id != null) {
      map['id'] = id;
    }
    map['title'] = title;
    map['date'] = date;
    map['status'] = status;
    map['description'] = description;

    return map;
  }

  ToDoModel.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    title = map['title'];
    date = map['date'];
    status = map['status'];
    description = map['description'];
  }
}
