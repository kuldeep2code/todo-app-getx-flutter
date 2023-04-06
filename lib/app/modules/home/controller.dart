import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app_getx/app/data/services/storage/repository.dart';

import '../../data/models/task.dart';

class HomeController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final formEditCtrl = TextEditingController();
  final chipIndex = 0.obs;
  TaskRepository taskRepository;

  HomeController({
    required this.taskRepository,
  });

  final tasks = <Task>[].obs;

  @override
  void onInit() {
    super.onInit();
    tasks.assignAll(taskRepository.readTasks());
    ever(tasks, (_) => taskRepository.writeTasks(tasks));
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  void changeChipIndex(int value) {
    chipIndex.value = value;
  }

  bool addTask(Task task) {
    if (tasks.contains(task)) {
      return false;
    }
    tasks.add(task);
    return true;
  }
}
