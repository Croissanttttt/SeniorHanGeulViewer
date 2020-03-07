import 'package:flutter/material.dart';
import 'package:flutter_app1/page 2.dart';

class Page1 extends StatelessWidget {
  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Page1StatefulWidget(),
    );
  }
}

class Page1StatefulWidget extends StatefulWidget {
  Page1StatefulWidget({Key key}) : super(key: key);

  @override
  _Page1StatefulWidgetState createState() => _Page1StatefulWidgetState();
}

class _Page1StatefulWidgetState extends State<Page1StatefulWidget> {
  void updateState() {
    print("Update State of FirstPage");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.call),
                    onPressed: (){
                      print('call');
                    },
                    iconSize: 100.0,
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                  IconButton(
                    icon: Icon(Icons.message),
                    onPressed: (){
                      print('message');
                    },
                    iconSize: 100.0,
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                  IconButton(
                    icon: Icon(Icons.book),
                    onPressed: (){
                      print('book');
                    },
                    iconSize: 100.0,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.wb_auto),
                    onPressed: (){
                      print('weather');
                    },
                    iconSize: 100.0,
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                  IconButton(
                    icon: Icon(Icons.music_note),
                    onPressed: (){
                      print('music');
                    },
                    iconSize: 100.0,
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                  IconButton(
                    icon: Icon(Icons.library_books),
                    onPressed: (){
                      print('band');
                    },
                    iconSize: 100.0,
                  ),
                ],
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RaisedButton(
                      child: Text('다음 페이지'),
                      onPressed: () async {
                        await Navigator.pushReplacement(
                            context, MaterialPageRoute(builder: (context) => Page2()));
                        updateState();
                      },
                    ),
                  ]
              )
            ]
        ),
      )
    );
  }
}