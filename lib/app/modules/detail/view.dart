import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app_getx/app/modules/home/controller.dart';

class DetailPage extends StatelessWidget {
  final homeCtrl = Get.find<HomeController>();
  DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Get.back();
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
