import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

class CountControllerReactive extends GetxController {
  RxInt count = 0.obs; //obs를 해주면 옵저버 기능이 부여된다. 지정시 기본 int타입이 아닌 RxInt로 지정해야 함

  void increase() {
    count++;
  }

  void putNumber(int value) {
    count(value);
  }

//GetX의 경우 다음과 같은 라이프 사이클이 존재한다.
  @override
  void onInit() {
    // TODO: implement onInit
    //ever의 경우 값이 변경될 때 마다 호출된다. reactive 상태(RxInt)일때만 가능하다.
    ever(count, (_) => print('매번 호출'));
    once(count, (_) => "count 값이 변경될 때 한번만 호출");
    debounce(count, (_) => print("이벤트가 끝났을 때(1초간 변화가 없을 때) 마지막 변경 한번만 호출"),
        time: Duration(seconds: 1));
    interval(count, (_) => print("변경되고 있는 동안에 1초마다 호출"));
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
