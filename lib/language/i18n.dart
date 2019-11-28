import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'zh_cn.dart';
import 'en.dart';

/// class Localizations The main implementation provides localized values
/// 类 Localizations 中主要实现提供了本地化值
class S implements WidgetsLocalizations {
  S();

  static S currentLanguage;

  static const SWithDelegate delegate = SWithDelegate();

  bool isZh = false;
  static S of(BuildContext context) => Localizations.of<S>(context, S);

  @override
  TextDirection get textDirection => TextDirection.ltr;

  String get windPageTitle => 'Wind';
  String get elegantPageTitle => 'Elegant';
  String get songPageTitle => 'Qu';
  String appUpdateFoundNewVersion(String version) => "New version $version";
}

/// class Delegate is use for when Locale change,load new Lcale resource,so it has a funcion  load().
/// Delegate类的职责是在Locale改变时加载新的Locale资源，所以它有一个load方法，Delegate类需要继承自LocalizationsDelegate类
class SWithDelegate extends LocalizationsDelegate<S> {
  const SWithDelegate();
  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale("en", "US"), // English
      Locale("zh", "CN"), // Chinese
    ];
  }

  @override
  Future<S> load(Locale locale) {
    final String lang = _getlang(locale);

    if (lang != null) {
      switch (lang) {
        case "en":
          S.currentLanguage = new $En();
          return SynchronousFuture<S>(S.currentLanguage);
        case "zh_CN":
          S.currentLanguage = new $Zh_CN();
          return SynchronousFuture<S>(S.currentLanguage);
        default:
        // NO-OP.
      }
    }
    S.currentLanguage = new S();
    return SynchronousFuture<S>(S.currentLanguage);
  }

  @override
  bool shouldReload(SWithDelegate old) => false;

  @override
  bool isSupported(Locale locale) => ['en', 'zh'].contains(locale.languageCode);

  // @override
  // bool isSupported(Locale locale) => _isSupportd(locale, true);

  bool _isSupportd(Locale locale, bool withCountry) {
    if (locale != null) {
      for (Locale supportdLocale in supportedLocales) {
        if (supportdLocale.languageCode != locale.languageCode) {
          continue;
        }
        if (supportdLocale.languageCode == locale.languageCode) {
          return true;
        }
        if (true != withCountry &&
            (supportdLocale.countryCode == null ||
                supportdLocale.countryCode.isEmpty)) {
          return true;
        }
      }
    }
    return false;
  }

  String _getlang(Locale lang) => lang == null
      ? null
      : lang.countryCode != null && lang.countryCode.isEmpty
          ? lang.languageCode
          : lang.toString();
}
