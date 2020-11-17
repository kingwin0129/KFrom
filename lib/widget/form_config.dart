import 'package:kform/widget/form_com_config.dart';

class KFormConfig{

  factory KFormConfig() => getInstance();

  static KFormConfig instance;

  KFormComConfig _comConfig;

  KFormConfig._(){
    _comConfig = new KFormComConfig();
  }


  static KFormConfig getInstance(){
    if(instance == null){
      instance = new KFormConfig._();
    }
    return instance;
  }


  void setComConfig(KFormComConfig comConfig){
    _comConfig = comConfig;
  }

  KFormComConfig getComConfig(){
    _comConfig = _comConfig ?? new KFormComConfig();
    return _comConfig ;
  }

}