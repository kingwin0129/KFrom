import 'package:flutter/material.dart';

import 'package:kform/kform.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: KForm.builder(
            cells: buildCells(),
            comConfig: KFormComConfig(
              titleStyle: TextStyle(fontSize: 16.0,color: Colors.blueAccent),
              padding: EdgeInsets.fromLTRB(30.0,10.0,30.0,10.0)
            ),
        ),
      ),
    );
  }


  List<KFormCellConfig> buildCells(){
    return [
      KFormCellConfig.input(title: "项目代码",value: "1233211234567",enabled: false),
      KFormCellConfig.input(title: "项目名称",placeholder: "请点我",style: KFormCellStyle(titleStyle: TextStyle(fontSize: 10.0,color: Colors.red))),
      KFormCellConfig.input(title: "项目主体",require: true),
      KFormCellConfig.input(title: "项目归属",obscureText: true),
      KFormCellConfig.input(title: "项目级别",maxLength: 5),
      KFormCellConfig.input(title: "项目类别",keyboardType: TextInputType.number),
      KFormCellConfig.input(title: "项目阶段",require: true,enabled: false),
      KFormCellConfig.selector(title: "项目类型",options: [
        "我是一楼",
        "我是二楼",
        "我是三楼",
        "我是四楼",
        "我是五楼",

      ])
    ];
  }
}
