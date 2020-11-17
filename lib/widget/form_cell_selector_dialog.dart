import 'package:flutter/material.dart';
import 'package:kform/kform.dart';
import 'package:kform/widget/form_config.dart';
import 'package:kform/widget/form_option_model.dart';


class KFormCellSelectDialog extends StatefulWidget {

  final List<KFormOptionModel> options;

  KFormCellSelectDialog({this.options});

  @override
  _KFormCellSelectDialogState createState() => _KFormCellSelectDialogState();

}

class _KFormCellSelectDialogState extends State<KFormCellSelectDialog> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height/2,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Text("我是标题",style: KFormConfig.getInstance().getComConfig().selectorDialogTitleStyle,),
          SizedBox(height: 5),
          Expanded(
            child: ListView.separated(
                itemCount: widget.options.length,
                itemBuilder: (BuildContext context,int index){
                  return ListTile(
                    title: Text(widget.options[index].value,style: KFormConfig.getInstance().getComConfig().selectorDialogListStyle,textAlign: TextAlign.center,),
                    onTap: (){
                      Navigator.of(context).pop(widget.options[index].value);
                    },
                  );
                },
              separatorBuilder: (context, index) => KFormConfig.getInstance().getComConfig().selectorDialogDivider,
            ),
          ),
        ],
      ),
    );
  }
}
