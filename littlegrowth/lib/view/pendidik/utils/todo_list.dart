// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:littlegrowth/utils/hex_to_color.dart';

class TodoListCustomWidget extends StatelessWidget {
  final String customTextTodo;

  const TodoListCustomWidget({
    super.key,
    required this.customTextTodo,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        color: HexToColor().hexStringToColor('62C9D8'),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                customTextTodo,
                softWrap: true,
                overflow: TextOverflow.visible,
              ),
            ),
            Row(
              children: [
                TextButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll<Color>(Colors.white),
                    iconColor: MaterialStatePropertyAll<Color>(Colors.black),
                  ),
                  child: Icon(Icons.edit_rounded),
                ),
                TextButton(
                  onPressed: () {},
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll<Color>(Colors.white),
                      iconColor: MaterialStatePropertyAll<Color>(Colors.black)),
                  child: Icon(CupertinoIcons.trash),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
