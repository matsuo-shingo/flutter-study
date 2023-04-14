import 'package:flutter/material.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({Key? key}) : super(key: key);

  @override
  State<TodoListPage> createState() => _TodoListState();


}

class _TodoListState extends State<TodoListPage> {
  List<String> listItems = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todoリスト'),
      ),
      body: ListView.builder(
        itemCount: listItems.length,
        itemBuilder: (context, index) {
          return Text(listItems[index]);
        },
      ),
    );
  }
}
