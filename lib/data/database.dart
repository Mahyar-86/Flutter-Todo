import 'package:hive/hive.dart';

class ToDoDataBase {
  List toDoList = [];

  final _myBox = Hive.box("myBox");

  void createInitialData() {
    toDoList = [
      ["Welcome to this App!", false],
      ["Do you enjoy this? :)", true],
    ];
  }

  void loadDataBase() {
    toDoList = _myBox.get("TODOLIST");
  }

  void updateDataBase() {
    _myBox.put("TODOLIST", toDoList);
  }
}
