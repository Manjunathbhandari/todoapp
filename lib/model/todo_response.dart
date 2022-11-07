
import 'package:todoapp/model/todos.dart';

///
///This TodoResponse class represent the Main outer portion of out todoApi respone
///that is :
///
///  {
///   "status":true,
///   "description":"resource fetched successfully!!",
///  "data":{
///  }
///   }
///

class TodoResponse {
  bool? status;
  String? description;
  ResponseData? data;



  TodoResponse({this.status, this.description,this.data});

  factory TodoResponse.fromJson(Map<String, dynamic> json) => TodoResponse(
      status : json['status'],
      description : json['description'],
      data:  (json['data'] != null) ? (
          ResponseData.fromJson(json["data"])
      ) :  null
  );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['status'] = status;
    data['description'] = description;
    data['data'] = this.data?.toJson();
    return data;
  }

  TodoResponse.withError(this.description);

}



/// ResponseData class is responsible for parsing the Data which is inside the 'data' filed in json
///
/// that is
///
// {
//     "todos":[
//       {
//         "id":1,
//         "todo_title":"Milk"
//       },
//       {
//         "id":2,
//         "todo_title":"Bread"
//       },
//       {
//         "id":3,
//         "todo_title":"Potato"
//       },
//       {
//         "id":4,
//         "todo_title":"Bananas"
//       }
//     ]
//}
///

class ResponseData {
  final List<Todo> todosList;


  const ResponseData({
    required this.todosList,
  });

  factory ResponseData.fromJson(Map<String, dynamic> json) => ResponseData(

    //Whenever we have a  Jsonarray value , we have to parse them as list like bellow
    // since the todos field is a JsonArray []  of todos, we have parsed it as
    todosList: List<Todo>.from(
        json["todos"].map((x) => Todo.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "todos": List<dynamic>.from(todosList.map((x) => x.toJson())),
  }; 
}
