import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app1/Basic Page.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  initializeDateFormatting().then((_) => runApp(Start()));
}

class Start extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '한글 바로가기',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BasicPage(title: 'Senior Viewer'),
      debugShowCheckedModeBanner: false,
    );
  }
}