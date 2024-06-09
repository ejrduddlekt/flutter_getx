import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_study/src/home.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
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
          ElevatedButton(
            onPressed: () {
              // Get.to(Home()); 이렇게 이동하면 스텍이 남아있어 뒤로가기 버튼이 활성화 된다. 그러므로 아래 메서드를 통해 홈으로 이동한다.
              // 기존 방식: Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_) => Home()), (route) => false);
              Get.offAll(Home());
            },
            child: Text('홈 이동'),
          )
        ],
      )),
    );
  }
}
