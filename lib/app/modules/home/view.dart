import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:todo_app_getx/app/core/utils/extensions.dart';
import 'package:todo_app_getx/app/core/values/colors.dart';
import 'package:todo_app_getx/app/data/models/task.dart';
import 'package:todo_app_getx/app/modules/home/controller.dart';
import 'package:todo_app_getx/app/modules/home/widgets/add_card.dart';
import 'package:todo_app_getx/app/modules/home/widgets/add_dialog.dart';
import 'package:todo_app_getx/app/modules/home/widgets/task_card.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.all(4.0.wp),
              child: Text(
                'My List',
                style: TextStyle(
                  fontSize: 24.0.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Obx(
              () => GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                children: [
                  ...controller.tasks.map((element) => LongPressDraggable(
                      data: element,
                      onDragStarted: () => controller.changeDeleting(true),
                      onDraggableCanceled: (velocity, offset) =>
                          controller.changeDeleting(false),
                      onDragEnd: (details) => controller.changeDeleting(false),
                      feedback: Opacity(
                        opacity: 0.5,
                        child: TaskCard(task: element),
                      ),
                      child: TaskCard(task: element))),
                  AddCard(),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: DragTarget<Task>(
        builder: (_, __, ____) {
          return Obx(
            () => FloatingActionButton(
              onPressed: () {
                if (controller.tasks.isNotEmpty) {
                  Get.to(() => AddDialog(), transition: Transition.downToUp);
                } else {
                  EasyLoading.showInfo('Please create task first..');
                }
              },
              backgroundColor: controller.deleting.value ? Colors.red : blue,
              child: Icon(controller.deleting.value ? Icons.delete : Icons.add),
            ),
          );
        },
        onAccept: (Task task) {
          controller.deleteTask(task);
          EasyLoading.showSuccess('Deleted');
        },
      ),
    );
  }
}
