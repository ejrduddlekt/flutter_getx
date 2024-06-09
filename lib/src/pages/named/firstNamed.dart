import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FirstNamedPage extends StatelessWidget {
  const FirstNamedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Named Page'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              Get.offNamed("/second"); //offNamed를 하면 자신의 페이지를 지우고 다음페이지로 이동 (뒤로가기를 클릭시 첫페이지가 나온다)
            },
            child: Text('다음페이지 이동'),
          )
        ],
      )),
    );
  }
}
