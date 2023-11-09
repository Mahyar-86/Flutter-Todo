import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo/data/database.dart';
import 'package:todo/utilities/dialog_box.dart';
import 'package:todo/utilities/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //make hive and database instance
  final _myBox = Hive.box("myBox");
  ToDoDataBase db = ToDoDataBase();

  @override
  //check if run app for the first time create a database, if not just load that
  void initState() {
    if (_myBox.get("TODOLIST") == null) {
      db.createInitialData();
    } else {
      db.loadDataBase();
    }
    super.initState();
  }

  //update checkbox status
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = value!;
    });
    db.updateDataBase();
  }

  final _controller = TextEditingController();

  //save new task function
  void saveNewTask() {
    setState(() {
      db.toDoList.add([_controller.text, false]);
    });
    db.updateDataBase();
    _controller.clear();
    Navigator.of(context).pop();
  }

  //create a panel to add new task
  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
              controller: _controller,
              onSave: saveNewTask,
              onCancel: () {
                _controller.clear();
                Navigator.of(context).pop();
              });
        });
  }

  //delete task function
  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateDataBase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //set background color
      backgroundColor: Colors.yellow[200],
      // make an appbar
      appBar: AppBar(
        centerTitle: true,
        title: Text("To Do"),
      ),
      //create a floating action button to add task
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: const Icon(Icons.add),
      ),
      //crate a list view to show tasks
      body: ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder: (context, index) {
          return TodoTile(
            taskName: db.toDoList[index][0],
            taskCompleted: db.toDoList[index][1],
            onChanged: (value) => checkBoxChanged(value, index),
            deleteFunction: (context) => deleteTask(index),
          );
        },
      ),
    );
  }
}
