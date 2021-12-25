import 'dart:async';
import 'package:apni_jagaah/app_localizations.dart';
import 'package:apni_jagaah/presentation/theme/app_theme.dart';
import 'package:apni_jagaah/route_generator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'constant/image_string.dart';
import 'constant/route_string.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    scheduleMicrotask(() {
      precacheImage(ImageString.place, context);
    });
    super.initState();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, widget) => ResponsiveWrapper.builder(
        ClampingScrollWrapper.builder(context, widget!),
        maxWidth: 1200,
        minWidth: 400,
        defaultScale: true,
        breakpoints: const [
          ResponsiveBreakpoint.resize(400, name: MOBILE),
          ResponsiveBreakpoint.autoScale(800, name: TABLET),
          ResponsiveBreakpoint.autoScale(1000, name: TABLET),
          ResponsiveBreakpoint.resize(1200, name: DESKTOP),
          ResponsiveBreakpoint.autoScale(2460, name: "4K"),
        ],
      ),
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(brightness: Brightness.light),
      // darkTheme: ThemeData(brightness: Brightness.dark),
      theme: AppTheme.lightTheme,
      darkTheme: ThemeData(
        brightness: Brightness.dark,

      ),
      themeMode: ThemeMode.system,
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('ur', 'PK'),
      ],
      locale: const Locale.fromSubtags(countryCode: 'US', languageCode: 'en'),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      localeResolutionCallback: (locale, supportedLocales) {
        for (var supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale!.languageCode &&
              supportedLocale.countryCode == locale.countryCode) {
            return supportedLocale;
          }
        }
        return supportedLocales.first;
      },
      initialRoute: RouteString.initialPage,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
