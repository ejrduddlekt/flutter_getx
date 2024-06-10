import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_study/src/pages/controller/count_controller_with_getx.dart';
import 'package:getx_study/src/pages/controller/count_controller_with_provider.dart';
import 'package:getx_study/src/pages/state/with_getx.dart';
import 'package:getx_study/src/pages/state/with_provider.dart';
import 'package:provider/provider.dart';

// 이 StatelessWidget은 단순 상태 관리를 위한 예제 화면입니다.
class SimpleStateManage extends StatelessWidget {
  const SimpleStateManage({super.key});

  @override
  Widget build(BuildContext context) {
    // GetX 패키지를 사용하여 CountControllerWithGetx 인스턴스를 의존성 주입합니다.
    // 이는 GetX 상태 관리를 위한 컨트롤러를 인스턴스화하고, GetX 시스템에 등록합니다.
    // provider와 달리 선언이 자유롭다
    Get.put(CountControllerWithGetx());

    return Scaffold(
      appBar: AppBar(
        title: const Text('단순상태관리'), // 앱바에 제목을 설정합니다.
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 첫 번째 Expanded 위젯은 WithGetX 위젯을 자식으로 가집니다.
            // WithGetX 위젯은 GetX 패키지를 사용하여 상태 관리를 수행합니다.
            Expanded(child: WithGetX()),

            // 두 번째 Expanded 위젯은 ChangeNotifierProvider로 CountControllerWithProvider를 제공하고,
            // WithProvider 위젯을 자식으로 가집니다.
            // ChangeNotifierProvider는 CountControllerWithProvider의 인스턴스를 생성하여
            // 하위 위젯들에게 상태를 전달합니다.
            Expanded(
              child: ChangeNotifierProvider<CountControllerWithProvider>(
                create: (_) => CountControllerWithProvider(),
                child: WithProvider(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
