// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:littlegrowth/utils/hex_to_color.dart';
import 'package:littlegrowth/view/pendidik/utils/todo_list.dart';

class HomePendidik extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    width: 200,
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
                    width: 200,
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
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll<Color>(Colors.white),
                      iconColor: MaterialStatePropertyAll<Color>(Colors.black),
                    ),
                    child: Icon(Icons.add),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      TodoListCustomWidget(
                        customTextTodo:
                            "Mendata Anak Didik kelas 1 yang tidak masuk kelas dikarenakan terlambat",
                      ),
                      TodoListCustomWidget(
                        customTextTodo:
                            "Mendata Anak Didik kelas 1 yang tidak masuk kelas dikarenakan terlambat",
                      ),
                      TodoListCustomWidget(
                        customTextTodo:
                            "Mendata Anak Didik kelas 1 yang tidak masuk kelas dikarenakan terlambat",
                      ),
                      TodoListCustomWidget(
                        customTextTodo:
                            "Mendata Anak Didik kelas 1 yang tidak masuk kelas dikarenakan terlambat",
                      ),
                      TodoListCustomWidget(
                        customTextTodo:
                            "Mendata Anak Didik kelas 1 yang tidak masuk kelas dikarenakan terlambat",
                      ),
                      TodoListCustomWidget(
                        customTextTodo:
                            "Mendata Anak Didik kelas 1 yang tidak masuk kelas dikarenakan terlambat",
                      ),
                      TodoListCustomWidget(
                        customTextTodo:
                            "Mendata Anak Didik kelas 1 yang tidak masuk kelas dikarenakan terlambat",
                      ),
                      TodoListCustomWidget(
                        customTextTodo:
                            "Mendata Anak Didik kelas 1 yang tidak masuk kelas dikarenakan terlambat",
                      ),
                      TodoListCustomWidget(
                        customTextTodo:
                            "Mendata Anak Didik kelas 1 yang tidak masuk kelas dikarenakan terlambat",
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              )
            ],
          ),
        ),
      ),
    );
  }
}
