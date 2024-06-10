import 'package:flutter/material.dart';
import 'package:getx_study/src/pages/controller/count_controller_with_provider.dart';
import 'package:provider/provider.dart';

class WithProvider extends StatelessWidget {
  const WithProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("provider", style: TextStyle(fontSize: 50),),
          
          // !아래 Text와 같이 사용하면 상태가 변화할 때 마다 전체 위젯트리가 빌드되므로 Consumer를 통해 성능 최적화가 필요하다.
          //Text("${Provider.of<CountControllerWithProvider>(context).count}", style: TextStyle(fontSize: 50),),

          Consumer<CountControllerWithProvider>(
            builder: (_,snapshot,child){
              return Text("${snapshot.count}", style: TextStyle(fontSize: 50),);
            }
            ),
          ElevatedButton(
            onPressed: () {
              Provider.of<CountControllerWithProvider>(context, listen: false).increase(); // listen: false를 하므로써 consumer에 있는 것만 재빌드
            },
            child: Text('+', style: TextStyle(fontSize: 30),),
          )
        ],
      ),
    );
  }
}
