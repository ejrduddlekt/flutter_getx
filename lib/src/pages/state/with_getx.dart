import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_study/src/pages/controller/count_controller_with_getx.dart';

// WithGetX 클래스는 StatelessWidget을 상속받아 GetX 상태 관리 패키지를 사용하는 예제입니다.
class WithGetX extends StatelessWidget {
  const WithGetX({super.key});

  // Increase하는 부분은 Provider의 경우 context에서 찾았으나, GetX는 다르게 동작합니다.
  // 장점으로 외부에서 따로 위젯을 빼줄 수 있습니다.
  // Provider에서 다음과 같이 사용하기 위해선 매개변수로 context를 넘겨주거나 Stateless가 아닌 Stateful을 사용해야 합니다.
  Widget button(String id) {
    return ElevatedButton(
      onPressed: () {
        // Get.find<CountControllerWithGetx>()를 사용하여 CountControllerWithGetx 인스턴스를 찾아서 increase 메서드를 호출합니다.
        Get.find<CountControllerWithGetx>().increase(id);
      },
      child: Text('+', style: TextStyle(fontSize: 30)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "getX",
            style: TextStyle(fontSize: 50),
          ),

          // GetBuilder는 GetX 패키지의 상태 관리 위젯으로, 상태가 변경될 때 빌더 함수가 호출되어 UI가 업데이트됩니다.
          // GetX의 장점으로는 id를 부여하여 controller를 별도로 동작 시킬 수 있다. (provider 불가능)
          GetBuilder<CountControllerWithGetx>(
            id: "first",
            builder: (controller) {
              return Text(
                "${controller.count}",
                style: TextStyle(fontSize: 50),
              );
            },
          ),

          GetBuilder<CountControllerWithGetx>(
            id: "second",
            builder: (controller) {
              return Text(
                "${controller.count}",
                style: TextStyle(fontSize: 50),
              );
            },
          ),

          // 첫 번째 버튼은 CountControllerWithGetx의 increase 메서드를 호출하여 "first" ID의 상태를 증가시킵니다.
          ElevatedButton(
            onPressed: () {
              Get.find<CountControllerWithGetx>().increase("first");
            },
            child: Text('+', style: TextStyle(fontSize: 30)),
          ),

          // 위의 button 메서드를 호출하여 두 번째 버튼을 생성합니다.
          // 이 버튼은 "second" ID의 상태를 증가시킵니다.
          button("second")
        ],
      ),
    );
  }
}
