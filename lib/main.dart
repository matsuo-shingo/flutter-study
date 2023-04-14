import 'package:count_up/todo_list_page.dart';
import 'package:flutter/material.dart';

import 'count_up_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CountUp',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const TodoListPage(),
      // const CountUpPage(title: 'CountUpPage'),
    );
  }
}
