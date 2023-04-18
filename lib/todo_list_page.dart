import 'package:flutter/material.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({Key? key}) : super(key: key);

  @override
  State<TodoListPage> createState() => _TodoListState();
}

class _TodoListState extends State<TodoListPage> {
  final List<String> _todoList = [];
  final _textController = TextEditingController();

  void _showAddDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('タスク追加'),
            content: TextField(
              controller: _textController,
              onSubmitted: (value) {
                _addTodoItem(value);
                Navigator.pop(context);
              },
            ),
            actions: <Widget>[
              ElevatedButton(
                  onPressed: () {
                    _addTodoItem(_textController.text);
                    _textController.clear();
                    Navigator.pop(context);
                  },
                  child: const Text('追加')),
            ],
          );
        });
  }

  void _showEditDialog(String oldTitle) {
    _textController.text = oldTitle;
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('タスク編集'),
            content: TextField(
              controller: _textController,
              onSubmitted: (value) {
                _editTodoItem(oldTitle, value);
                Navigator.pop(context);
              },
            ),
            actions: <Widget>[
              ElevatedButton(
                  onPressed: () {
                    _editTodoItem(oldTitle, _textController.text);
                    Navigator.pop(context);
                  },
                  child: const Text('編集')),
            ],
          );
        });
  }


  // void _addTodoItem(String title) {
  //   if (title.isNotEmpty && !_todoList.contains(title)) {
  //     setState(() {
  //       _todoList.add(title);
  //     });
  //     _textController.clear();
  //   }
  // }

  void _showErrorDialog(String message) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('エラー'),
            content: Text(message),
            actions: <Widget>[
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('閉じる'),
              ),
            ],
          );
        });
  }

  void _addTodoItem(String title) {
    if (title.isNotEmpty) {
      if (!_todoList.contains(title)) {
        setState(() {
          _todoList.add(title);
        });
        _textController.clear();
      } else {
        _showErrorDialog('タスクが既に存在します。別のタスク名を入力してください。');
      }
    }
  }


  void _editTodoItem(String oldTitle, String newTitle) {
    if (newTitle.isNotEmpty && !_todoList.contains(newTitle)) {
      setState(() {
        _todoList[_todoList.indexOf(oldTitle)] = newTitle;
      });
    }
  }

  void _deleteTodoItem(String title) {
    setState(() {
      _todoList.remove(title);
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todoリスト'),
      ),
      body: ListView.builder(
        itemCount: _todoList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_todoList[index]),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () => _showEditDialog(_todoList[index]),
                ),
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () => _deleteTodoItem(_todoList[index]),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddDialog,
        tooltip: 'タスク追加',
        child: const Icon(Icons.add),
      ),
    );
  }
}
