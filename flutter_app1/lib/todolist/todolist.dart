import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_app1/todolist/new_todo.dart';
import 'package:flutter_app1/todolist/todo.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_app1/todolist/Constants.dart';

class Todolist extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '한글 바로가기',
      home: Home(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}

class Home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> with SingleTickerProviderStateMixin{
  List<Todo> list = new List<Todo>();
  SharedPreferences sharedPreferences;

  @override
  void initState() {
    loadSharedPreferencesAndData();
    super.initState();
  }

  void loadSharedPreferencesAndData() async {
    sharedPreferences = await SharedPreferences.getInstance();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.grey[600],
          child: Icon(Icons.add),
          onPressed: () =>goToNewItemView(),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(
                  top: 60.0, left: 30.0, right: 30.0, bottom: 30.0),
              child: Text(
                '할 일 목록',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 50.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                ),
                child: list.isEmpty ? emptyList() : buildListView(),
              ),
            ),
          ],
        ),
    );
  }

  Widget emptyList(){
    return Center(
        child:  Text(
          '할 일 없음',
          style: TextStyle(fontSize: 30),
        )
    );
  }

  Widget buildListView() {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (BuildContext context,int index){
        return buildItem(list[index], index);
      },
    );
  }

  Widget buildItem(Todo item, index){
    return Dismissible(
      key: Key('${item.hashCode}'),
      background: Container(color: Colors.red[700]),
      onDismissed: (direction) => removeItem(item),
      direction: DismissDirection.startToEnd,
      child: buildListTile(item, index),
    );
  }

  Widget buildListTile(Todo item, int index){
    return Card(
      child: ListTile(
        onLongPress: () => goToEditItemView(item),
        title: Text(
          item.title,
          key: Key('item-$index'),
          style: TextStyle(
              color: Colors.black,
          ),
        ),
        trailing: PopupMenuButton<String>(
            onSelected: choiceAction,
            icon: Icon(Icons.more_vert),
            itemBuilder: (BuildContext context) {
              return Constants.choices.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            }
        ),
      ),
    );
  }

  void goToNewItemView(){
    // Here we are pushing the new view into the Navigator stack. By using a
    // MaterialPageRoute we get standard behaviour of a Material app, which will
    // show a back button automatically for each platform on the left top corner
    Navigator.of(context).push(MaterialPageRoute(builder: (context){
      return NewTodoView();
    })).then((title){
      if(title != null) {
        addItem(Todo(title: title));
      }
    });
  }

  void addItem(Todo item){
    // Insert an item into the top of our list, on index zero
    list.insert(0, item);
    saveData();
  }

  void goToEditItemView(item){
    // We re-use the NewTodoView and push it to the Navigator stack just like
    // before, but now we send the title of the item on the class constructor
    // and expect a new title to be returned so that we can edit the item
    Navigator.of(context).push(MaterialPageRoute(builder: (context){
      return NewTodoView(item: item);
    })).then((title){
      if(title != null) {
        editItem(item, title);
      }
    });
  }

  void editItem(Todo item ,String title){
    item.title = title;
    saveData();
  }

  void removeItem(Todo item){
    list.remove(item);
    saveData();
  }

  void loadData() {
    List<String> listString = sharedPreferences.getStringList('list');
    if(listString != null){
      list = listString.map(
              (item) => Todo.fromMap(json.decode(item))
      ).toList();
      setState((){});
    }
  }

  void saveData(){
    List<String> stringList = list.map(
            (item) => json.encode(item.toMap()
        )).toList();
    sharedPreferences.setStringList('list', stringList);
  }

  void choiceAction(String choice) {
    Todo item;
    if (choice == Constants.Modifying) {
      print('Modifying');
      goToEditItemView(item);
    }
    if (choice == Constants.Delete) {
      print('Delete');
      removeItem(item);
    }
  }
}