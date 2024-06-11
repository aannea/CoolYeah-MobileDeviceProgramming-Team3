// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:littlegrowth/utils/hex_to_color.dart';
import 'package:littlegrowth/view/pendidik/models/pendidik_todo.dart';
import 'package:littlegrowth/view/pendidik/services/todo_service.dart';

class HomePendidik extends StatelessWidget {
  final TextEditingController _textEditingController = TextEditingController();
  final TodoService _todoService = TodoService();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: HexToColor().hexStringToColor("62C9D8"),
        body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'images/pendidik_hero.png',
                        width: 250,
                        height: 250,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: (MediaQuery.of(context).size.width - 48) / 2,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              children: [
                                Icon(
                                  Icons.menu_book_rounded,
                                  color: Colors.black87,
                                ),
                                SizedBox(height: 8),
                                Text(
                                  'Laporan Fisik Anak',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 10,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: (MediaQuery.of(context).size.width - 48) / 2,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Padding(
                            padding: const EdgeInsets.all(13.0),
                            child: Column(
                              children: [
                                Icon(
                                  Icons.menu_book_rounded,
                                  color: Colors.black87,
                                ),
                                SizedBox(height: 8),
                                Text(
                                  'Laporan Akademik Anak',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 10,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Todo List',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          _displayTextInputDialog(context);
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll<Color>(Colors.white),
                          iconColor:
                              MaterialStatePropertyAll<Color>(Colors.black),
                        ),
                        child: Icon(Icons.add),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 450,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: StreamBuilder(
                        stream: _todoService.getTodos(),
                        builder: (context, snapshot) {
                          List todos = snapshot.data?.docs ?? [];
                          if (todos.isEmpty) {
                            return Center(
                              child: Text("Add a todo!"),
                            );
                          }
                          return ListView.builder(
                            itemCount: todos.length,
                            itemBuilder: (context, index) {
                              Todo todo = todos[index].data();
                              String todoId = todos[index].id;
                              return Container(
                                margin: const EdgeInsets.all(5.0),
                                decoration: BoxDecoration(
                                  color: HexToColor().hexStringToColor('62C9D8'),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 10,
                                    horizontal: 10,
                                  ),
                                  child: ListTile(
                                    title: Expanded(
                                      child: Text(
                                        todo.task,
                                        softWrap: true,
                                        overflow: TextOverflow.visible,
                                      ),
                                    ),
                                    trailing: Checkbox(
                                      value: todo.isDone,
                                      onChanged: (value) {
                                        Todo updateTodo =
                                            todo.copyWith(isDone: !todo.isDone);
                                        _todoService.updateTodo(
                                            todoId, updateTodo);
                                      },
                                    ),
                                    onLongPress: () {
                                      _todoService.deleteTodo(todoId);
                                    },
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
      
      ),
    );
  }

  void _displayTextInputDialog(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Tambah Todo'),
          content: TextField(
            controller: _textEditingController,
            decoration: InputDecoration(hintText: "Todo..."),
          ),
          actions: <Widget>[
            MaterialButton(
              color: HexToColor().hexStringToColor('62C9D8'),
              textColor: Colors.white,
              child: Text('Buat'),
              onPressed: () {
                Todo todo = Todo(
                  task: _textEditingController.text,
                  isDone: false,
                );
                _todoService.addTodo(todo);
                Navigator.pop(context);
                _textEditingController.clear();
              },
            )
          ],
        );
      },
    );
  }
}
