import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kform/constant/form_cell_type.dart';
import 'package:kform/widget/form_cell_config.dart';
import 'package:kform/widget/form_cell_selector_dialog.dart';
import 'package:kform/widget/form_config.dart';
import 'package:kform/widget/form_option_model.dart';


class KFormCell extends StatefulWidget {

  final KFormCellConfig config;

  KFormCell(this.config);


  @override
  _KFormCellState createState() => _KFormCellState();
}

class _KFormCellState extends State<KFormCell> {

  TextEditingController _controller = TextEditingController();

  KFormCellConfig get _config => widget.config;

  bool get _isSelector => _config.type == KFormCellType.selector
                      ||  _config.type == KFormCellType.multipleSelector
                      ||  _config.type == KFormCellType.customSelector;

  @override
  Widget build(BuildContext context) {
    _controller.text = _config.value;
    return Column(
      children: [
        Container(
          padding: _config.style.padding ?? KFormConfig.getInstance().getComConfig().padding,
          child: Row(
            children: [
              buildTitleWidget(),
              SizedBox(
                width: KFormConfig.getInstance().getComConfig().titleValuePath,
              ),
              Expanded(child: buildFiledWidget()),
              _config.suffixWidget != null ? _config.suffixWidget(context,_config) : SizedBox.shrink()

            ],
          ),
        ),
        _config.style.divider ?? KFormConfig.getInstance().getComConfig().divider
      ],
    );
  }

  RichText buildTitleWidget(){
      return RichText(
        text: TextSpan(
          text: _config.title ?? "",
          style: _config.style.titleStyle ?? KFormConfig.getInstance().getComConfig().titleStyle,
          children: [
            TextSpan(
              text:  _config.require ?? false ? "*" : "",
              style:TextStyle(color: _config.style.requireColor)
            )
          ]
        ),
      );
  }

  CupertinoTextField buildFiledWidget(){

      return CupertinoTextField(
        controller: _controller,
        placeholder: _config.placeholder,
        enabled: _config.enabled,
        maxLength: _config.maxLength,
        obscureText: _config.obscureText,
        textAlign: _config.textAlign,
        keyboardType: TextInputType.multiline,
        clearButtonMode: _config.clearButtonMode,
        readOnly: _isSelector,
        style: _config.style.filedStyle ?? KFormConfig.getInstance().getComConfig().valueStyle,
        placeholderStyle: _config.style.placeholderStyle ?? KFormConfig.getInstance().getComConfig().placeholderStyle,
        minLines: 1,
        maxLines: _config.maxLines ?? 1,
        decoration: BoxDecoration(),
        onChanged: (value){
          _config.value = value;
        },
        onTap: (){
          if(_config.type == KFormCellType.selector){
            showSelectorDialog();
          }
        },
      );
  }

  Future<void> showSelectorDialog()async{
    _controller.text = await showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (_){
        return WillPopScope(
          onWillPop: () async{
            return Future.value(true);
          },
          child: KFormCellSelectDialog(
              options: _config.options.every(
                      (element) => (element is KFormOptionModel)) ?
                      <KFormOptionModel>[..._config.options]
                          : _config.options.map(
                              (e) {
                                return KFormOptionModel(value: e);
                              }
                            ).toList() ),
        );
      }
    );
  }

}
