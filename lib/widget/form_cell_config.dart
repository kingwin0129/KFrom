import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kform/constant/form_cell_type.dart';
import 'package:kform/widget/form_cell.dart';
import 'package:kform/widget/form_cell_style.dart';

/// 表单组件配置
class KFormCellConfig {

  /// 唯一标识
  String tag;

  /// 类型
  KFormCellType type;

  /// 是否可编辑
  bool enabled;

  /// 是否必填
  bool require;

  /// 必填项属否显示 *
  bool requireStar;

  /// 样式
  KFormCellStyle style;

  /// 输入类型配置

  /// 标题
  String title;

  /// 输入值
  String value;

  /// 输入占位符
  String placeholder;

  /// 输入最大长度
  int maxLength;

  /// 输入最大行数
  int maxLines;

  /// 文本是否加密
  bool obscureText;

  /// 弹出键盘类型
  TextInputType keyboardType;

  /// 输入框文本对齐方式
  TextAlign textAlign;

  /// 清除按钮显示模式
  OverlayVisibilityMode clearButtonMode;

  /// 后缀自定义组件
  Widget Function(BuildContext,KFormCellConfig) suffixWidget;



  /// 选项列表
  List options;


  /// 输入组件
  KFormCellConfig.input({
    this.tag,
    this.title = "",
    this.value = "",
    this.placeholder = "请输入",
    this.enabled = true,
    this.require = false,
    this.requireStar = false,
    this.style,
    this.obscureText = false,
    this.textAlign = TextAlign.center,
    this.maxLength,
    this.maxLines = 1,
    this.clearButtonMode = OverlayVisibilityMode.editing,
    this.keyboardType = TextInputType.text}){
    this.type = KFormCellType.input;
    if(this.obscureText){
      this.maxLines = 1;
    }
    if(!this.enabled){
      this.require = false;
      this.clearButtonMode = OverlayVisibilityMode.never;
      this.placeholder = "";

    }
    if(null == style){
      style = new KFormCellStyle();
    }

  }


  /// 单选组件
  KFormCellConfig.selector({
    this.tag,
    this.title = "",
    this.value = "",
    this.placeholder = "请输入",
    this.enabled = true,
    this.require = false,
    this.requireStar = false,
    this.style,
    this.obscureText = false,
    this.textAlign = TextAlign.center,
    this.maxLength,
    this.maxLines = 1,
    this.clearButtonMode = OverlayVisibilityMode.never,
    this.options,
    this.keyboardType = TextInputType.text}){
    this.type = KFormCellType.selector;
    this.style = new KFormCellStyle();
    this.clearButtonMode = OverlayVisibilityMode.never;
    if(!this.enabled){
      this.require = false;
      this.clearButtonMode = OverlayVisibilityMode.never;
    }

  }
}
