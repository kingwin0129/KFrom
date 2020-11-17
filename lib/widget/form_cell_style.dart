import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kform/widget/form_config.dart';

/// 表单组件样式
class KFormCellStyle{

  /// 高度
  double height;

  /// 内边距
  EdgeInsets padding;

  /// 分割线
  Divider divider;

  /// 必填标识颜色
  Color requireColor;

  /// 标题类型样式
  TextStyle titleStyle;

  /// 文本类型样式
  TextStyle filedStyle;

  /// 文本提示样式
  TextStyle placeholderStyle;



  KFormCellStyle(
      {
        this.height,
        this.padding,
        this.divider,
        this.requireColor = Colors.red,
        this.titleStyle,
        this.filedStyle,
        this.placeholderStyle
      }){
  }
}