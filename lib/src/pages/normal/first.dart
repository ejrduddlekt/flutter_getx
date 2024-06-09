import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_study/src/pages/normal/Second.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Page'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              //GetX를 사용하지 않은 버전 : Navigator.of(context).push(MaterialPageRoute(builder: (_) => FirstPage(),),);
              Get.to(SecondPage());
            },
            child: Text('다음페이지 이동'),
          )
        ],
      )),
    );
  }
}
