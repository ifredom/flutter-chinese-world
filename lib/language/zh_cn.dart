import 'package:flutter/material.dart';
import 'i18n.dart';

class $Zh_CN extends S {
  $Zh_CN();

  @override
  TextDirection get textDirection => TextDirection.ltr;

  String get windPageTitle => '风';
  String get elegantPageTitle => '雅';
  String get songPageTitle => '颂';

  @override
  String appUpdateFoundNewVersion(String version) => "发现新版本$version,是否更新?";
}
