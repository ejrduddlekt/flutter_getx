import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_study/src/home.dart';
import 'package:getx_study/src/pages/Next.dart';
import 'package:getx_study/src/pages/named/firstNamed.dart';
import 'package:getx_study/src/pages/named/secondNamed.dart';
import 'package:getx_study/src/pages/user.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: Home(),  //해당부분은 routes에서 잡아주기 때문에 이제 필요가 없다.
      initialRoute: "/",

      // //기존 방식
      // routes: {
      //   "/": (context) => Home(),
      //   "/first": (context) => FirstNamedPage(),
      //   "/second": (context) => SecondNamedPage(),
      // },

      //GetX의 방식
      getPages: [
        GetPage(name: "/", page: () => Home(), transition: Transition.fade),
        GetPage(name: "/first", page: () => FirstNamedPage(), transition: Transition.zoom),
        GetPage(name: "/second", page: () => SecondNamedPage(), transition: Transition.leftToRightWithFade),
        GetPage(name: "/next", page: () => NextPage(), transition: Transition.zoom),
        GetPage(name: "/user/:uid", page: () => UserPage(), transition: Transition.zoom)
      ],
    );
  }
}
