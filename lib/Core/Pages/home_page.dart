import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riferpord_test/Core/providers/add_task.dart';
import 'package:riferpord_test/Core/widgets/add_task_widgrt.dart';
import 'package:riferpord_test/Core/widgets/box_info_task.dart';
import 'package:riferpord_test/Core/widgets/custom_text.dart';
import 'package:riferpord_test/Core/widgets/task_widget.dart';
import 'package:riferpord_test/Core/widgets/top_bar.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    final provider = ref.watch(fistProvider);

    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // top bar
              TopBar(),

              // sizedBox
              SizedBox(
                height: 20,
              ),
              // what's up, Jou
              CustomText(
                text: 'what\'s up, Mohammed!',
                color: Colors.indigo.shade900,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
              // sizedBox
              SizedBox(
                height: 30,
              ),
              // catgoreis title
              CustomText(
                text: 'Catgories',
                color: Colors.grey.shade600,
              ),
              // sizedBox
              SizedBox(
                height: 20,
              ),
              // info catogries Box
              Container(
                margin: EdgeInsets.all(5),
                height: 130,
                child: ListView.builder(
                  itemCount:
                      ref.watch(fistProvider.notifier).listTypesBoxInfo.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (con, ind) {
                    return BoxInfoTask(
                        boxInfoModelTask: ref
                            .watch(fistProvider.notifier)
                            .listTypesBoxInfo[ind]);
                  },
                ),
              ),

              SizedBox(
                height: 30,
              ),
              // title today's tasks
              CustomText(
                text: 'TODAY\'s TASKS',
                color: Colors.grey.shade600,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(
                height: 20,
              ),
              // Place ToDay Task
              Expanded(
                child: Container(
                  height: 80,
                  child: ListView.builder(
                      itemCount: provider.length,
                      itemBuilder: (con, ind) {
                        return TaskWidget(
                          taskModel: provider[ind],
                          ind: ind,
                        );
                      }),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: AddTask(),
    );
  }
}
