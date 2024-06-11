import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_study/src/pages/controller/count_controller_with_getx.dart';
import 'package:getx_study/src/pages/controller/count_controller_with_reactive.dart';

// 이 StatelessWidget은 단순 상태 관리를 위한 예제 화면입니다.
class ReactiveStateManage extends StatelessWidget {
  const ReactiveStateManage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CountControllerReactive()); //GetX에 인스턴스를 등록

    return Scaffold(
      appBar: AppBar(
        title: const Text('반응형상태관리'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Getx",
              style: TextStyle(fontSize: 30),
            ),
            //? Obx를 사용시 Get.find로 RxInt count = 0.obs;를 내부에 반드시 참조를 해야 한다.
            // Obx를 활용하여 위젯을 업데이트 하면 장점으로 값이 변경 될 때에만 화면이 업데이트 된다.
            // 그러므로 아래 버튼의 5로 변경을 연타해도 화면을 업데이트 하진 않고 변경될 시에만 업데이트 한다.
            // 일반적인 상태관리에서는 값이 같아도 화면을 업데이트 한다.
            Obx(
              () => Text(
                "${Get.find<CountControllerReactive>().count.value}",
                style: TextStyle(fontSize: 50),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Get.find<CountControllerReactive>().increase();
              },
              child: Text('+', style: TextStyle(fontSize: 30)),
            ),
            ElevatedButton(
              onPressed: () {
                Get.find<CountControllerReactive>().putNumber(5);
              },
              child: Text('5로 변경', style: TextStyle(fontSize: 30)),
            )
          ],
        ),
      ),
    );
  }
}
