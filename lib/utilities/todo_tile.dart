import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoTile extends StatelessWidget {
  //define the name and status of the task variables
  final String taskName;
  final bool taskCompleted;
  //define Functions to change status and delete task
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;

  TodoTile({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
    required this.deleteFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      //make a space for tiles
      padding: const EdgeInsets.only(left: 25.0, right: 25.0, top: 25.0),
      //create slidable system
      child: Slidable(
				endActionPane: ActionPane(
          //set a motion to slide
					motion: StretchMotion(),
					children: [
            //if slide and press on button delete the task
						SlidableAction(onPressed: deleteFunction,
						backgroundColor: Colors.red.shade300,
						icon: Icons.delete,
            //make corners smoother
						borderRadius: BorderRadius.circular(12),
						)
					],
				),
				child: Container(
					padding: const EdgeInsets.all(25.0),
					decoration: BoxDecoration(
						color: Colors.yellow,
						borderRadius: BorderRadius.circular(12.0),
					),
					child: Row(
						children: [
							Padding(
								padding: const EdgeInsets.only(right: 3.0),
                //create check box for task
								child: Checkbox(
									value: taskCompleted,
									onChanged: onChanged,
									activeColor: Colors.black,
								),
							),
              //create the task name
							Text(
										taskName,
                    //if task has checked make it strike through
										style: TextStyle(
											decoration: taskCompleted ? TextDecoration.lineThrough : TextDecoration.none,
										),
								),
						],
					),
				),
			),
    );
  }
}
