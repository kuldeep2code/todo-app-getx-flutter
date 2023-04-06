import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:todo_app_getx/app/core/utils/extensions.dart';
import 'package:todo_app_getx/app/data/models/task.dart';
import 'package:todo_app_getx/app/modules/home/controller.dart';

class TaskCard extends StatelessWidget {
  final homeCtrl = Get.find<HomeController>();
  final Task task;
  TaskCard({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    final color = HexColor.fromHex(task.color);
    final cardWidth = Get.width - 12.0.wp;

    return Container(
      width: cardWidth / 2,
      height: cardWidth / 2,
      margin: EdgeInsets.all(3.0.wp),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey[300]!,
            blurRadius: 7,
            offset: const Offset(0, 7),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          StepProgressIndicator(
            totalSteps: 100,
            currentStep: 80,
            size: 5,
            padding: 0,
            selectedGradientColor: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [color.withOpacity(0.5), color],
            ),
            unselectedGradientColor: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.white, Colors.white],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(6.0.wp),
            child: Icon(
              IconData(task.icon, fontFamily: 'MaterialIcons'),
              color: color,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(6.0.wp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  task.title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12.0.sp,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: 2.0.wp,
                ),
                Text(
                  '${task.todos?.length ?? 0} Tasks',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
