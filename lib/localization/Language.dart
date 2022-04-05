import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:tourguide/components/everest.dart';
import 'package:tourguide/localization/localization.dart';

class LanguageClass extends StatefulWidget {
  static void setLocale(BuildContext context, Locale locale){
    _LanguageClassState? state = context.findAncestorStateOfType<_LanguageClassState>();
    state?.setLocale(locale);
  }

  @override
  State<LanguageClass> createState() => _LanguageClassState();
}

class _LanguageClassState extends State<LanguageClass> {
  late Locale _locale;

  void setLocale(Locale locale){
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: _locale,
        supportedLocales: [
          Locale("en", "US"),
          Locale("fa", "IR"),
          Locale("ar", "SA"),
          Locale("hi", "IN")
        ],
        localizationsDelegates: [
          DemoLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        // gives device local as well as supported locals
        localeListResolutionCallback: (locales, supportedLocales) {
            // We map the supported locales to language codes
            // note that this is completely optional and this logic can be changed as you like
            final supportedLanguageCodes =
                supportedLocales.map((e) => e.languageCode);
            if (locales != null) {
                // we iterate over the locales and find the first one that is supported
                for (final locale in locales) {
                    if (supportedLanguageCodes.contains(locale.languageCode)) {
                        return locale;
                    }
                }
            }
           return supportedLocales.first;
        },
      home: EverestDetail(),
    );
  }
}


// localeListResolutionCallback: (devicelocale, supportedLocales){
//           for (var locale in supportedLocales){
//             if (locale.languageCode == devicelocale.languageCode && locale.countryCode == devicelocale.countryCode){
//               return devicelocale;
//             }
//           }
//           return supportedLocales.first;
//         },
