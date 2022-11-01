// @dart = 2.12
// ignore_for_file: import_of_legacy_library_into_null_safe
class ToDo {
  String? id;
  String? todoText;
  bool isDone;

  ToDo({required this.id, required this.todoText, this.isDone = false});

  static List<ToDo> todoList() {
    return [];
  }
}
