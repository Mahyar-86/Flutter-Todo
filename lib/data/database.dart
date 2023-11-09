import 'package:hive/hive.dart';

class ToDoDataBase {
  List toDoList = [];

  final _myBox = Hive.box("myBox");

  //set default database 
  void createInitialData() {
    toDoList = [
      ["Welcome to this App!", false],
      ["Do you enjoy this? :)", true],
    ];
  }

  //load database
  void loadDataBase() {
    toDoList = _myBox.get("TODOLIST");
  }

  //update new changes in database
  void updateDataBase() {
    _myBox.put("TODOLIST", toDoList);
  }
}
