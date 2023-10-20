import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riferpord_test/Core/models/taskModel.dart';
import 'package:riferpord_test/Core/providers/add_task.dart';
import 'package:riferpord_test/Core/widgets/custom_text.dart';

// ignore: must_be_immutable
class TaskWidget extends ConsumerWidget {
  TaskWidget({super.key, required this.taskModel, required this.ind});
  TaskModel taskModel;
  int ind;

  @override
  Widget build(BuildContext context, ref) {
    // final typeTask = ref.watch(fistProvider.notifier).currentType;
    return Container(
      height: 70,
      padding: EdgeInsets.only(top: 10, left: 15, bottom: 10, right: 10),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(1, 1),
              blurRadius: 2,
            )
          ]),
      child: Row(
        children: [
          IconButton(
              onPressed: () {
                ref.read(fistProvider.notifier).changeStateTask(ind);
                Future.delayed(Duration(milliseconds: 1500), () {
                  ref.read(fistProvider.notifier).reomveTask(ind);
                });
              },
              icon: Icon(
                taskModel.isCompleted ? Icons.done : Icons.circle_outlined,
                size: 35,
                color: taskModel.typeTask == 'study'
                    ? Colors.green
                    : taskModel.typeTask == 'buesness'
                        ? Colors.red
                        : taskModel.typeTask == 'personal'
                            ? Colors.blue
                            : Colors.amber,
              )),
          SizedBox(
            width: 10,
          ),
          CustomText(
            text: '${taskModel.text}',
            fontSize: 17,
          )
        ],
      ),
    );
  }
}
