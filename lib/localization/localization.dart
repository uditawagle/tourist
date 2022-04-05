import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DemoLocalizations {
  final Locale locale;

  DemoLocalizations(this.locale);

  static DemoLocalizations of(BuildContext context) {
    return Localizations.of<DemoLocalizations>(context, DemoLocalizations)!;
  }

  Map<String, String>? _localizedValues;

  //function for loading json file
  Future<void> load() async {
    String jsonStringValues =
        await rootBundle.loadString('lib/lang/${locale.languageCode}.json');

    Map<String, dynamic> mappedJson = json.decode(jsonStringValues);

    _localizedValues = mappedJson.map((key, value) => MapEntry(key, value.toString()));
  }

   String? getTranslatedValues(String key){
     return _localizedValues![key];
   }

   static const LocalizationsDelegate<DemoLocalizations> delegate = _DemoLocalizationDelegate();

}

//creating private class to load
class _DemoLocalizationDelegate extends LocalizationsDelegate<DemoLocalizations> {
  const _DemoLocalizationDelegate();

  @override
  bool isSupported( Locale locale){
    return ['en','fa','ar','hi'].contains(locale.languageCode);
  }

  // while calling this method it just load json data with language code
  @override
  Future<DemoLocalizations> load(Locale locale) async{
    DemoLocalizations localizations = new DemoLocalizations(locale);
    await localizations.load();
    return localizations;

  }

  @override
  bool shouldReload(_DemoLocalizationDelegate old) => false;

}