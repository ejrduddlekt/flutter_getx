import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_study/src/home.dart';

class NextPage extends StatelessWidget {
  const NextPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NextPage'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //Text("name: ${Get.arguments['name']}, age: ${Get.arguments['age']}"),
          Text("name: ${(Get.arguments as User).name}, age: ${(Get.arguments as User).age}"),
          ElevatedButton(
            onPressed: () {
              //GetX를 사용하지 않은 버전 : Navigator.of(context).pop();
              Get.back(); // GetX는 context접근이 없다.
            },
            child: Text('뒤로 이동'),
          ),
        ],
      )),
    );
  }
}
