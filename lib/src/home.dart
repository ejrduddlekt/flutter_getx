import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_study/src/pages/normal/first.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("라우트 관리 홈"),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              //GetX를 사용하지 않은 버전 : Navigator.of(context).push(MaterialPageRoute(builder: (_) => FirstPage(),),);
              Get.to(FirstPage());
            },
            child: Text('일반적인 라우트 방식'),
          ),
          SizedBox(height: 16), 
          ElevatedButton(
            onPressed: () {
              //GetX를 사용하지 않은 버전 : Navigator.of(context).pushNamed("/first");
              Get.toNamed("/first");
            },
            child: Text('Named 라우트 방식'),
          ),
          SizedBox(height: 16), 
          ElevatedButton(
            onPressed: () {
              //Get.toNamed("/next", arguments: {"name": "정덕영", "age":32});
              Get.toNamed("/next", arguments: User(name: "정덕영", age: 32));
              //Get.to(FirstPage(), arguments: "value"); //두가지 방식 모두 가능하다.
            },
            child: Text('Arguments 전달'),
          ),
          SizedBox(height: 16), 
          ElevatedButton(
            onPressed: () {
              Get.toNamed("/user/123141?name=정덕영&age=32");
            },
            child: Text('동적 URL 전달'),
          )
        ],
      )),
    );
  }
}

class User {
  String name; 
  int? age;

  //생성자로 name의 경우 required를 통해 null값을 받을 수 없으나 age는 ?를 사용하여 null 사용이 가능
  User({required this.name, this.age}); 
}
