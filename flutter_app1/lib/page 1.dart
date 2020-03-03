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
      appBar: AppBar(
        title: const Text('Sample App'),
        actions: [
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {},
          ),
        ],
      ),

      body: new Center(
        child: new GridView.count(
            crossAxisCount: 2,
            childAspectRatio: 4/2.9,
            children: <Widget>[
              Center(
                child: Container(
                    color: Colors.lightBlue[300],
                    child:IconButton(
                      iconSize: 130.0,
                      icon:Icon(Icons.call,color: Colors.white),
                      onPressed: () {},
                    )),
              ),
              Center(
                child: Container(
                    color: Colors.deepOrange[300],
                    child:IconButton(
                      iconSize: 130.0,
                      icon:Icon(Icons.message,color: Colors.white),
                      onPressed:() {},
                    )),
              ),
              Center(
                child: Container(
                    color: Colors.lightBlue[200],
                    child:IconButton(
                      iconSize: 130.0,
                      icon:Icon(Icons.photo_camera,color: Colors.white),
                      onPressed: () {},
                    )),
              ),
              Center(
                child: Container(
                    color: Colors.lightBlue[300],
                    child:IconButton(
                      iconSize: 130.0,
                      icon:Icon(Icons.call,color: Colors.white),
                      onPressed: () {},
                    )),
              ),
              Center(
                child: Container(
                    color: Colors.deepOrange[300],
                    child:IconButton(
                      iconSize: 130.0,
                      icon:Icon(Icons.message,color: Colors.white),
                      onPressed:() {},
                    )),
              ),
              Center(
                child: Container(
                    color: Colors.lightBlue[300],
                    child:IconButton(
                      iconSize: 130.0,
                      icon:Icon(Icons.call,color: Colors.white),
                      onPressed: () {},
                    )),
              ),
              Center(
                child: Container(
                    color: Colors.deepOrange[300],
                    child:IconButton(
                      iconSize: 130.0,
                      icon:Icon(Icons.message,color: Colors.white),
                      onPressed:() {},
                    )),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30,3,30,3),
                child: RaisedButton(
                  child: Text('다음 페이지'),
                  onPressed: () async {
                    await Navigator.pushReplacement(
                        context, MaterialPageRoute(builder: (context) => Page2()));
                    updateState();
                  },
                ),
              )
            ]
        ),
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