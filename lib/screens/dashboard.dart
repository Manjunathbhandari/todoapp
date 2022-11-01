import 'package:flutter/material.dart';
import 'package:todoapp/model/todo_response.dart';
import '../model/taskmodel.dart';
import '../model/todos.dart';
import '../services/remote_services.dart';

// ignore: must_be_immutable
class DashboardPage extends StatefulWidget {
  String name;

  DashboardPage({Key? key, required this.name}) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  State<DashboardPage> createState() => _DashboardPageState(name);
}

class _DashboardPageState extends State<DashboardPage> {
  String name;

  _DashboardPageState(this.name);

  /// todoList variable will be initialized later once we load the data from the API
  late List<Todo> todoList;

  ///isTodoLoaded is for check whether we have loaded the data from the Api or not
  bool isTodoLoaded = false;


  final _todoController = TextEditingController();
  bool _checked = false;

  @override
  void initState() {
    WidgetsFlutterBinding.ensureInitialized(); //this line is to tell flutter to complete its widget biding thing first

    fetchTodo(); // call the method which will call the api

    super.initState();
  }

  fetchTodo() async {
    TodoResponse? todoResponse = await getTodos();
    if (todoResponse != null && todoResponse.data != null) {
      // successfully loaded the list of todos from the server
      setState(() {
        isTodoLoaded = true;
        todoList = todoResponse.data!.todosList;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        color: const Color.fromARGB(255, 240, 240, 240),
        child: SingleChildScrollView(
          child: Form(
              child: Column(
            children: [
              Container(
                constraints: const BoxConstraints(
                  maxWidth: 600,
                  maxHeight: 280,
                ),
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/Rectangle 45.png'),
                        fit: BoxFit.cover)),
                child: Column(
                  children: [
                    Align(
                        alignment: Alignment.topLeft,
                        child: Image.asset(
                          'assets/images/Shape.png',
                          height: 130,
                        )),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (builder) => bottomSheet());
                        },
                        child: const CircleAvatar(
                          radius: 40,
                          backgroundImage:
                              AssetImage('assets/images/Ellipse 85.png'),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Text(
                        "Welcome ${name[0].toUpperCase()}${name.substring(1).toLowerCase()}",
                        style: const TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 17,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(40, 20, 0, 5),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text("Task List",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 16,
                      )),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: Container(
                      height: 330,
                      width: 320,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 0),
                          color: Colors.white,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20)),
                          boxShadow: const [
                            BoxShadow(
                                blurRadius: 10,
                                offset: Offset(0, 10),
                                blurStyle: BlurStyle.outer,
                                spreadRadius: 1),
                            BoxShadow(
                                color: Color.fromARGB(255, 255, 255, 255),
                                blurRadius: 10,
                                offset: Offset(-5, 0),
                                blurStyle: BlurStyle.outer,
                                spreadRadius: 1),
                            BoxShadow(
                                color: Color.fromARGB(255, 255, 255, 255),
                                blurRadius: 10,
                                offset: Offset(5, 0),
                                blurStyle: BlurStyle.outer,
                                spreadRadius: 1),
                          ]),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Task List",
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 15,
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) =>
                                            AlertDialog(
                                              title: const Text("Add"),
                                              content: TextFormField(
                                                  autofocus: true,
                                                  onFieldSubmitted: (_) =>
                                                      Navigator.pop(context),
                                                  controller: _todoController,
                                                  decoration:
                                                      const InputDecoration(
                                                          hintText:
                                                              "Enter the task")),
                                              actions: [
                                                TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                            context, "Cancel"),
                                                    child:
                                                        const Text("Cancel")),
                                                TextButton(
                                                    onPressed: () => {
                                                          Navigator.of(context)
                                                              .pop(
                                                            _addTodoItem(
                                                                _todoController
                                                                    .text),
                                                          )
                                                        },
                                                    child: const Text(
                                                      "Submit",
                                                    )),
                                              ],
                                            ));
                                  },
                                  child: const CircleAvatar(
                                      maxRadius: 15,
                                      backgroundColor:
                                          Color.fromARGB(255, 80, 195, 202),
                                      child: Icon(
                                        Icons.add,
                                        color: Colors.white,
                                      )),
                                )
                              ],
                            ),
                          ),
                          if (!isTodoLoaded) ...[
                            const Center(child: Text("Loading..."))
                          ] else ...[
                            ListView.builder(
                                itemCount: todoList.length,
                                shrinkWrap: true,
                                itemBuilder: ((context, index) {
                                  return InkWell(
                                    onTap: () {
                                      setState(() {
                                        _checked = !_checked;
                                      });
                                    },
                                    child: Row(
                                      children: [
                                        Checkbox(
                                            value: _checked,
                                            onChanged: (value) {
                                              setState(() {
                                                _checked = value!;
                                              });
                                            }),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Text(todoList[index].todoTitle,
                                            style: const TextStyle(
                                              fontFamily: 'Poppins Regular',
                                              fontSize: 16,
                                            ))
                                      ],
                                    ),
                                  );
                                }))
                          ],
                          //
                          // Expanded(
                          //     child: FutureBuilder<dynamic>(
                          //         future: getTodos(),
                          //         builder: (context, snapshot) {
                          //           if (!snapshot.hasData) {
                          //             return Center(child: Text("Loading..."));
                          //           } else {
                          //             return ListView.builder(
                          //                 itemCount: snapshot.data.length,
                          //                 itemBuilder: ((context, index) {
                          //                   return InkWell(
                          //                     onTap: () {
                          //                       setState(() {
                          //                         _checked = !_checked;
                          //                       });
                          //                     },
                          //                     child: Row(
                          //                       children: [
                          //                         Checkbox(
                          //                             value: _checked,
                          //                             onChanged: (value) {
                          //                               setState(() {
                          //                                 _checked = value!;
                          //                               });
                          //                             }),
                          //                         const SizedBox(
                          //                           width: 10,
                          //                         ),
                          //                         Text(
                          //                             snapshot.data[index]
                          //                                 .todoTitle,
                          //                             style: const TextStyle(
                          //                               fontFamily:
                          //                                   'Poppins Regular',
                          //                               fontSize: 16,
                          //                             ))
                          //                       ],
                          //                     ),
                          //                   );
                          //                 }));
                          //           }
                          //         }))
                        ],
                      ))),
            ],
          )),
        ));
  }

  // void _handleToDOChange(ToDo todo) {
  //   setState(() {
  //     todo.isDone = !todo.isDone;
  //   });
  // }

  _addTodoItem(String toDo) {
    setState(() {
      todoList.add(
          Todo(id: DateTime.now().microsecondsSinceEpoch, todoTitle: toDo));
    });
    _todoController.clear();
  }

  // void _deleteToDoItem(String id) {
  //   setState(() {
  //     todoList.removeWhere((item) => item.id == id);
  //   });
  // }

  Widget bottomSheet() {
    return Container(
        height: 100,
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Text(
              "Choose Profile Photo",
              style: TextStyle(fontFamily: 'Poppins', fontSize: 16),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.camera_alt),
                      label: const Text("Camera",
                          style:
                              TextStyle(fontFamily: 'Poppins', fontSize: 15))),
                  const SizedBox(
                    width: 30,
                  ),
                  TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.image),
                      label: const Text("Gallery",
                          style:
                              TextStyle(fontFamily: 'Poppins', fontSize: 15))),
                ],
              ),
            )
          ],
        ));
  }
}
