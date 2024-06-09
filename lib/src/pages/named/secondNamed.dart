import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SecondNamedPage extends StatelessWidget {
  const SecondNamedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Named Page'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              //GetX를 사용하지 않은 버전 : Navigator.of(context).pop();
              Get.back(); // GetX는 context접근이 없다.
            },
            child: Text('뒤로 이동'),
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              Get.offAllNamed("/");
            },
            child: Text('홈 이동'),
          )
        ],
      )),
    );
  }
}
