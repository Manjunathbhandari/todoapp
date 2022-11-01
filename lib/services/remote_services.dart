import 'package:dio/dio.dart';

import '../model/todos.dart';

Future<dynamic> getTodos() async {
  var dio = Dio();
  var response = await dio.get(
      'https://59fa2f24-1d38-47be-9c41-9418fec7b082.mock.pstmn.io/getTodos');
  Todo todo = response.data['data'];
  if (response.statusCode == 200) {
    return todo.todoTitle;
  } else {
    return <Todo>[];
  }
}
