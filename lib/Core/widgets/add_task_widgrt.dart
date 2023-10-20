import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riferpord_test/Core/models/taskModel.dart';
import 'package:riferpord_test/Core/providers/add_task.dart';
import 'package:riferpord_test/Core/widgets/choice_type_task.dart';

class AddTask extends ConsumerWidget {
  const AddTask({
    super.key,
  });

  @override
  Widget build(BuildContext context, ref) {
    TextEditingController controller = TextEditingController();
    return SingleChildScrollView(
      child: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return Container(
                height: MediaQuery.sizeOf(context).height * 0.8,
                color: Colors.white,
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Container(
                          margin: EdgeInsets.only(top: 10),
                          width: 50,
                          height: 8,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(15)),
                        ),
                      ),

                      // SIZEd Box
                      SizedBox(
                        height: 20,
                      ),

                      // choice type task
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: ChoiceTypeTask(),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: SizedBox(
                          width: 340,
                          child: TextField(
                            controller: controller,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Write it',
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Center(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.purple),
                          onPressed: () {
                            if (controller.text != '') {
                              final type =
                                  ref.read(fistProvider.notifier).currentType;
                              ref.read(fistProvider.notifier).addNewTask(
                                  TaskModel(controller.text, type, false));
                              // print('Text: ' + controller.text);
                              // print('Type: ' + type.toString());
                              // print('Done add ${controller.text}');
                              Navigator.pop(context);
                            }
                          },
                          child: Text(
                            'Add your Task',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
        child: Icon(
          Icons.add,
          size: 40,
        ),
      ),
    );
  }
}
