class Todo {
  Todo({
    required this.id,
    required this.todoTitle,
  });

  int id;
  String todoTitle;

  factory Todo.fromJson(Map<String, dynamic> json) => Todo(
        id: json["id"],
        todoTitle: json["todo_title"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "todo_title": todoTitle,
      };
}
