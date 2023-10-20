// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riferpord_test/Core/providers/add_task.dart';

class ChoiceTypeTask extends ConsumerWidget {
  const ChoiceTypeTask({
    super.key,
  });

  @override
  Widget build(BuildContext context, ref) {
    final firstProviderr = ref.watch(fistProvider);
    final curreintTypeProvider = ref.watch(fistProvider.notifier).currentType;
    return Row(
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              shape: OutlinedBorder.lerp(
                  CircleBorder(
                      side: BorderSide(
                          width: curreintTypeProvider == 'buesness' ? 3 : 0)),
                  null,
                  0)),
          onPressed: () {
            ref.read(fistProvider.notifier).setType('buesness');
            print(curreintTypeProvider);
          },
          child: null,
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              shape: OutlinedBorder.lerp(
                  CircleBorder(
                      side: BorderSide(
                          width: curreintTypeProvider == 'study' ? 3 : 0)),
                  null,
                  0)),
          onPressed: () {
            ref.read(fistProvider.notifier).setType('study');
            // print(curreintTypeProvider);

            // ref.read(fistProvider.notifier).getOnlyOneType('buesness');
          },
          child: null,
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              shape: OutlinedBorder.lerp(
                  CircleBorder(
                      side: BorderSide(
                          width: curreintTypeProvider == 'personal' ? 3 : 0)),
                  null,
                  0)),
          onPressed: () {
            ref.read(fistProvider.notifier).setType('personal');
            print(curreintTypeProvider);
          },
          child: null,
        ),
      ],
    );
  }
}
