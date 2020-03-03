import 'package:flutter/material.dart';
import 'package:flutter_app1/page 1.dart';
import 'package:flutter_app1/clock/clock.dart';

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Page2',
      home: Page2StatefulWidget(),
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
      appBar: AppBar(
        title: const Text('Second Page'),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(
              height: 200,
              color: Colors.black,
              child: Clock()
          ),
          Container(
            height: 150,
            color: Colors.blueAccent,
          ),
          Container(
            height: 150,
            color: Colors.greenAccent,
          ),
          RaisedButton(
            child: Text('이전 페이지'),
            onPressed: () async {
              await Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Page1()));
            },
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0.0,
        child: Container(
          child: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}