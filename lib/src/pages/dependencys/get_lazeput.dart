import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_study/src/pages/controller/dependency_controller.dart';

class GetLazeput extends StatelessWidget {
  const GetLazeput({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: ElevatedButton(
          onPressed: () {
            Get.find<DependencyController>().increase();
          },
          child: Text(''),
        ));
  }
}
