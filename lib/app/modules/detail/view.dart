import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:todo_app_getx/app/modules/home/controller.dart';

import '../../core/utils/extensions.dart';

class DetailPage extends StatelessWidget {
  var homeCtrl = Get.find<HomeController>();
  DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    var task = homeCtrl.task.value!;
    var color = HexColor.fromHex(task.color);
    return Scaffold(
      body: Form(
        key: homeCtrl.formKey,
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.all(3.0.wp),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () {
                      Get.back();
                      homeCtrl.changeTask(null);
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0.wp),
              child: Row(
                children: [
                  Icon(
                    IconData(
                      task.icon,
                      fontFamily: 'MaterialIcons',
                    ),
                    color: color,
                  ),
                  SizedBox(
                    width: 3.0.wp,
                  ),
                  Text(
                    task.title,
                    style: TextStyle(
                        fontSize: 12.0.sp, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Obx(
              () {
                var totalTodos =
                    homeCtrl.doingTodos.length + homeCtrl.doneTodos.length;
                return Padding(
                  padding: EdgeInsets.only(
                    top: 3.0.wp,
                    left: 16.0.wp,
                    right: 8.0.wp,
                  ),
                  child: Row(
                    children: [
                      Text(
                        '$totalTodos Tasks',
                        style: TextStyle(
                            fontSize: 12.0.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey),
                      ),
                      SizedBox(
                        width: 3.0.wp,
                      ),
                      Expanded(
                        child: StepProgressIndicator(
                          totalSteps: totalTodos == 0 ? 1 : totalTodos,
                          currentStep: homeCtrl.doneTodos.length,
                          size: 5,
                          padding: 0,
                          selectedGradientColor: LinearGradient(
                            colors: [color.withOpacity(0.5), color],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          unselectedGradientColor: LinearGradient(
                            colors: [Colors.grey[300]!, Colors.grey[400]!],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 5.0.wp,
                vertical: 2.0.wp,
              ),
              child: TextFormField(
                controller: homeCtrl.formEditCtrl,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
