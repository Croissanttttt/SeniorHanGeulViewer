class Todo {
  String title;

  Todo({
    this.title,
  });

  Todo.fromMap(Map map) :
        this.title = map['title'];

  Map toMap(){
    return {
      'title': this.title,
    };
  }
}