import 'package:flutter/material.dart';
import 'package:riferpord_test/Core/models/box_info_task.dart';
import 'package:riferpord_test/Core/models/taskModel.dart';
import 'package:riverpod/riverpod.dart';

class AddNewTask extends StateNotifier<List<TaskModel>> {
  AddNewTask() : super([]);

  void addNewTask(TaskModel newTask) {
    state = [...state, newTask];
  }

  void changeStateTask(int ind) {
    if (ind >= 0 && ind <= state.length) {
      final updateList = List<TaskModel>.from(state);
      updateList[ind] = TaskModel(updateList[ind].text,
          updateList[ind].typeTask, !updateList[ind].isCompleted);
      state = updateList;
    }
  }

  List<TaskModel> getOnlyOneType(String typeTasks) {
    List<TaskModel> list = state.where((element) {
      return element.typeTask == typeTasks;
    }).toList(); // Need to convert the result to a list

    return list;
  }

  void reomveTask(int ind) {
    final list = List<TaskModel>.from(state);
    list.removeAt(ind);
    state = list;
  }

  List<String> typesTask = ['buesness', 'study', 'personal'];
  String currentType = '';
  void setType(String curentTypee) {
    currentType = curentTypee;
    state = [...state];
  }

  List<BoxInfoTaskModel> listTypesBoxInfo = [
    BoxInfoTaskModel(2, 'buesness', Colors.green),
    BoxInfoTaskModel(17, 'study', Colors.blue),
    BoxInfoTaskModel(24, 'personal', Colors.red),
  ];

  String checkFromType(String newStrig) {
    if (newStrig == 'buesness') {
      return 'buesness';
    } else if (newStrig == 'study') {
      return 'study';
    } else if (newStrig == 'personal') {
      return 'personal';
    } else {
      return 'null';
    }
  }

  int checkFromNumberType(String newStrig) {
    if (newStrig == 'buesness') {
      return getOnlyOneType('buesness').length;
    } else if (newStrig == 'study') {
      return getOnlyOneType('study').length;
    } else if (newStrig == 'personal') {
      return getOnlyOneType('personal').length;
    } else {
      return 0;
    }
  }
}

final fistProvider = StateNotifierProvider<AddNewTask, List<TaskModel>>((ref) {
  return AddNewTask();
});

// secons Provider

class HandleManagentTypes extends StateNotifier<String> {
  HandleManagentTypes() : super('');
}

final secondProvider = StateNotifierProvider<HandleManagentTypes, String>(
  (ref) => HandleManagentTypes(),
);
