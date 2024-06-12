import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_study/src/pages/controller/dependency_controller.dart';
import 'package:getx_study/src/pages/dependencys/get_put.dart';

class DependencyManagePage extends StatelessWidget {
  const DependencyManagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("의존성 주입"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () => {
                        //binding: 페이지를 보내주면서 사용할 컨트롤러를 주입하는 방법
                        Get.to(GetPut(),
                            //BindingsBuilder에 정의를 내려준다.
                            binding: BindingsBuilder(() {
                          //!생성된 인스턴스는 페이지가 열릴때 등록되었다가 페이지가 종료되면 메모리에서 삭제
                          Get.put(DependencyController());
                        }))
                      },
                  child: Text("GetPut")),
              ElevatedButton(
                  onPressed: () => {
                        Get.to(GetPut(), binding: BindingsBuilder(() {
                          //! 바로 인스턴스가 생성되나 put과 다른점은
                          //  비동기 프로세스가 필요한 경우 사용한다.
                          Get.putAsync<DependencyController>(() async {
                            await Future.delayed(Duration(seconds: 5));
                            return DependencyController();
                          });
                        }))
                      },
                  child: Text("Get.lazyPut")),
              ElevatedButton(
                  onPressed: () => {
                        Get.to(GetPut(), binding: BindingsBuilder(() {
                          Get.lazyPut<DependencyController>(
                              () => DependencyController());
                        }))
                      },
                  child: Text("Get.putAsync")),

              //위의 3가지 방식은 싱글톤 방식이었으나, 인스턴스를 여러개 만들 수 있다.
              //접근할 때 마다 게속해서 생성을 하나 잘 사용하진 않는다.
              ElevatedButton(
                  onPressed: () => {
                        Get.to(GetPut(), binding: BindingsBuilder(() {
                          Get.create<DependencyController>(
                              () => DependencyController());
                        }))
                      },
                  child: Text("Get.Create"))
            ],
          ),
        ));
  }
}
