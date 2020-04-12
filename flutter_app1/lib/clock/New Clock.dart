import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class wookieclock extends StatefulWidget {
  wookieclock({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _wookieclockState createState() => _wookieclockState();
}

class _wookieclockState extends State<wookieclock> {
  String _timeString;

  @override
  void initState() {
    _timeString = _formatDateTime(DateTime.now());
    Timer.periodic(Duration(seconds: 1), (Timer t) => _getTime());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _timeString,
      style: TextStyle(fontSize: 40, color: Colors.black),);
  }

  void _getTime() {
    final DateTime now = DateTime.now();
    final String formattedDateTime = _formatDateTime(now);
    setState(() {
      _timeString = formattedDateTime;
    });
  }

  String _formatDateTime(DateTime dateTime) {
    return DateFormat(' yyyy년  MM월  dd일 \naa hh시 mm분 ss초').format(dateTime);
  }
}