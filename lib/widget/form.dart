import 'package:flutter/material.dart';
import 'package:kform/widget/form_cell.dart';
import 'package:kform/widget/form_cell_config.dart';
import 'package:kform/widget/form_com_config.dart';
import 'package:kform/widget/form_config.dart';


class KForm extends StatefulWidget {

  final List<KFormCellConfig> cells;




  KForm.builder({this.cells,KFormComConfig comConfig}){
    if(null != comConfig){
      KFormConfig.getInstance().setComConfig(comConfig);
    }
  }

  @override
  _KFormState createState() => _KFormState();
}

class _KFormState extends State<KForm> {

  List<KFormCellConfig> get cells => widget.cells;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: cells.map((e){return  KFormCell(e);}).toList(),
    );
  }
}
