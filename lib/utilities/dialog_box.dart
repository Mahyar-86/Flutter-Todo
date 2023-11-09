import 'package:flutter/material.dart';
import 'package:todo/utilities/my_button.dart';

class DialogBox extends StatelessWidget {
  //define a controller to get text from textfield
  final controller;
  //define onSave and onCancel functions
  VoidCallback onSave;
  VoidCallback onCancel;

  DialogBox({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        backgroundColor: Colors.yellow,
        //create a container to add textfield
        content: Container(
          height: 120,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              //create a textfield to input the new task
              TextField(
                controller: controller,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Type Task Name..."
                    ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  //create Save and Cancel Buttons
                  MyButton(text: "Cancel", onPressed: onCancel),
                  MyButton(text: "Save", onPressed: onSave),
                ],
              )
            ],
          ),
        )
    );
  }
}
