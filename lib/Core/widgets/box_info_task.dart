import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riferpord_test/Core/models/box_info_task.dart';
import 'package:riferpord_test/Core/providers/add_task.dart';
import 'package:riferpord_test/Core/widgets/custom_text.dart';

// ignore: must_be_immutable
class BoxInfoTask extends ConsumerWidget {
  BoxInfoTask({super.key, required this.boxInfoModelTask});

  BoxInfoTaskModel boxInfoModelTask;

  @override
  Widget build(BuildContext context, ref) {
    final provider = ref.watch(fistProvider.notifier);
    return Container(
      height: 130,
      width: 200,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          // add small and large text (custom) >> optional choice
          BoxShadow(
            color: Colors.grey,
            offset: Offset(1, 1),
            blurRadius: 4,
            spreadRadius: 0,
          ),
        ],
      ),
      // element witch inside box Info
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // number tasks
          CustomText(
            text:
                '${provider.checkFromNumberType(boxInfoModelTask.typeTask).toString()} tasks',
            color: Colors.grey.shade600,
          ),
          SizedBox(
            height: 6,
          ),
          // todo type
          CustomText(
            text: '${boxInfoModelTask.typeTask}',
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
          SizedBox(
            height: 6,
          ),
          // color todo
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(top: 10, left: 10),
                width: 70,
                height: 2,
                color: boxInfoModelTask.colorTask,
              ),
              Container(
                margin: EdgeInsets.only(
                  top: 10,
                ),
                height: 8,
                width: 3,
                color: boxInfoModelTask.colorTask,
              ),
              Container(
                margin: EdgeInsets.only(
                  top: 10,
                ),
                width: 70,
                height: 2,
                color: Colors.grey,
              ),
            ],
          )
        ],
      ),
    );
  }
}
