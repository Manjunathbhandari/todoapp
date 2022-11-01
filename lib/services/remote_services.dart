import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:todoapp/model/todo_response.dart';

import '../model/todos.dart';

Future<dynamic> getTodos() async {
  var dio = Dio();
  var response = await dio.get('https://59fa2f24-1d38-47be-9c41-9418fec7b082.mock.pstmn.io/getTodos');

  if (response.statusCode == 200) {
    print(response.data);

    //in this case the response.data is in the format of string thats why we are converting it to json here in the bellow line
    final jsonDecodedResponse = json.decode(response.data) as Map<String, dynamic>;

    return TodoResponse.fromJson(jsonDecodedResponse);
  } else {
    return <Todo>[];
  }
}
