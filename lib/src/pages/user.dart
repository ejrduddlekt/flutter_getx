import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_study/src/home.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('URL'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("name: ${Get.parameters['uid']}"),
          Text("name: ${Get.parameters['name']}님 안녕하세요"),
          Text("name: ${Get.parameters['age']}"),
          ElevatedButton(
            onPressed: () {
              Get.back(); // GetX는 context접근이 없다.
            },
            child: Text('뒤로 이동'),
          ),
        ],
      )),
    );
  }
}
