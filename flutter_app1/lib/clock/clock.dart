import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart' show DateFormat;

class Clock extends StatefulWidget {
  Clock({Key key}) : super(key: key);

  @override
  _ClockState createState() => _ClockState();
}

class _ClockState extends State<Clock> {
  Time _now = Time();
  Date _nowDate = Date();

  // Tick the clock
  @override
  void initState() {
    Timer.periodic(Duration(seconds: 1), (v) {
      setState(() {
        _nowDate = Date();
        _now = Time();
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(50),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Columns for the clock
              DateText(
                  dateInteger: _nowDate.yearThousands
              ),
              DateText(
                  dateInteger: _nowDate.yearHundreds
              ),
              DateText(
                  dateInteger: _nowDate.yearTens
              ),
              DateText(
                  dateInteger: _nowDate.yearOnes
              ),
              Text(
                '년',
                style: TextStyle(fontSize: 40, color: Colors.white),
              ),
              DateText(
                  dateInteger: _nowDate.monthTens
              ),
              DateText(
                  dateInteger: _nowDate.monthOnes
              ),
              Text(
                '월',
                style: TextStyle(fontSize: 40, color: Colors.white),
              ),
              DateText(
                  dateInteger: _nowDate.dayTens
              ),
              DateText(
                  dateInteger: _nowDate.dayOnes
              ),
              Text(
                '일',
                style: TextStyle(fontSize: 40, color: Colors.white),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Columns for the clock
              ClockText(
                  TimeInteger: _now.hourTens
              ),
              ClockText(
                  TimeInteger: _now.hourOnes
              ),
              Text(
                ':',
                style: TextStyle(fontSize: 40, color: Colors.white),
              ),
              ClockText(
                  TimeInteger: _now.minuteTens
              ),
              ClockText(
                  TimeInteger: _now.minuteOnes
              ),
              Text(
                ':',
                style: TextStyle(fontSize: 40, color: Colors.white),
              ),
              ClockText(
                  TimeInteger: _now.secondTens
              ),
              ClockText(
                  TimeInteger: _now.secondOnes
              ),
            ],
          ),
        ],
      ));
  }
}

class Time {
  List<String> TimeIntegers;

  Time() {
    DateTime now = DateTime.now();
    String hhmmss = DateFormat("Hms").format(now).replaceAll(':', '');

    TimeIntegers = hhmmss
        .split('')
        .map((str) => int.parse(str).toRadixString(2).padLeft(4, '0'))
        .toList();
  }

  get hourTens => TimeIntegers[0];
  get hourOnes => TimeIntegers[1];
  get minuteTens => TimeIntegers[2];
  get minuteOnes => TimeIntegers[3];
  get secondTens => TimeIntegers[4];
  get secondOnes => TimeIntegers[5];
}

class ClockText extends StatelessWidget {
  String TimeInteger;
  List bits;

  ClockText({this.TimeInteger}) {
    bits = TimeInteger.split('');
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      int.parse(TimeInteger, radix: 2).toString(),
      style: TextStyle(fontSize: 40, color: Colors.white),
    );
  }
}

class Date {
  List<String> dateIntegers;

  Date() {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('dd-MM-yyyy').format(now).replaceAll('-', '');

    dateIntegers = formattedDate
        .split('')
        .map((str) => int.parse(str).toRadixString(2).padLeft(4, '0'))
        .toList();
  }

  get dayTens => dateIntegers[0];
  get dayOnes => dateIntegers[1];
  get monthTens => dateIntegers[2];
  get monthOnes => dateIntegers[3];
  get yearThousands => dateIntegers[4];
  get yearHundreds => dateIntegers[5];
  get yearTens => dateIntegers[6];
  get yearOnes => dateIntegers[7];
}

class DateText extends StatelessWidget {
  String dateInteger;
  List bits;

  DateText({this.dateInteger}) {
    bits = dateInteger.split('');
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      int.parse(dateInteger, radix: 2).toString(),
      style: TextStyle(fontSize: 40, color: Colors.white),
    );
  }
}