import 'package:flutter/material.dart';

/// 表单公共属性
class KFormComConfig{

  /// 标题样式
  TextStyle titleStyle;

  /// 输入值样式
  TextStyle valueStyle;

  /// 提示大小
  TextStyle placeholderStyle;

  Color placeholderColor;

  /// 容器内边距
  EdgeInsets padding;

  /// 标题与值之间的边距
  double titleValuePath;

  /// 分割线
  Divider divider;

  /// 选择对话框标题样式
  TextStyle selectorDialogTitleStyle;

  /// 选择对话框列表样式
  TextStyle selectorDialogListStyle;

  /// 选择对话框分割线
  Divider selectorDialogDivider;


  KFormComConfig({
    this.titleStyle,
    this.valueStyle,
    this.placeholderStyle,
    this.selectorDialogTitleStyle,
    this.selectorDialogListStyle,
    this.padding,
    this.titleValuePath = 5.0,
    this.divider,
    this.selectorDialogDivider
  }){
    if(null == this.titleStyle){
      this.titleStyle = TextStyle(fontSize: 14.0,color: Colors.black);
    }
    if(null == this.valueStyle){
      this.valueStyle = TextStyle(fontSize: 14.0,color: Colors.black);
    }
    if(null == this.placeholderStyle){
      this.placeholderStyle = TextStyle(fontSize: 14.0,color: Colors.black26);
    }
    if(null == this.selectorDialogTitleStyle){
      this.selectorDialogTitleStyle = TextStyle(fontSize: 16.0,color: Colors.blue);
    }
    if(null == this.selectorDialogListStyle){
      this.selectorDialogListStyle = TextStyle(fontSize: 14.0,color: Colors.black);
    }
    if(null == this.padding){
      this.padding = EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 5.0);
    }
    if(null == this.divider){
      this.divider = Divider(height: 0.5,thickness: 0.5,);
    }
    if(null == this.selectorDialogDivider){
      this.selectorDialogDivider = Divider(height: 0.5,thickness: 0.5,);
    }
  }

}