import 'package:bachelorproef/injection/injectorConfig.dart';
import 'package:bachelorproef/widgets/showcase.dart';
import 'package:flutter/material.dart';
import 'package:bachelorproef/generated/i18n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  final config = ProductionConfig();
  await config.configureInjection();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate],
      supportedLocales: S.delegate.supportedLocales,
      title: 'Bachelorproef',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Showcase(),
    );
  }
}