import 'package:flutter/material.dart';
import 'package:flutter_app1/page 1.dart';
import 'package:flutter_app1/page 3.dart';
import 'package:flutter_app1/clock/clock.dart';

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '한글 바로가기',
      home: Page2StatefulWidget(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Page2StatefulWidget extends StatefulWidget {
  @override
  _Page2StatefulWidgetState createState() => _Page2StatefulWidgetState();
}

class _Page2StatefulWidgetState extends State<Page2StatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
        child: Clock()
      ),
        bottomNavigationBar: BottomAppBar(
            elevation: 0.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                FlatButton(
                    onPressed: () async {
                      await Navigator.push(
                          context, MaterialPageRoute(builder: (context) => Page1()));
                    },
                    child: Text(
                        '이전 화면',
                        style: TextStyle(color: Colors.black, fontSize: 25)
                    )
                ),
                FlatButton(
                    onPressed: () async {
                      await Navigator.push(
                          context, MaterialPageRoute(builder: (context) => Page3()));
                    },
                    child: Text(
                        '다음 화면',
                        style: TextStyle(color: Colors.black, fontSize: 25)
                    )
                ),
              ],
            )
        )
    );
  }
}