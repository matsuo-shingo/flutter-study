import 'package:flutter/material.dart';

class CountUpPage extends StatefulWidget {
  const CountUpPage({super.key, required this.title});

  final String title;

  @override
  State<CountUpPage> createState() => _CountUpPageState();
}

class _CountUpPageState extends State<CountUpPage> {
  int _counter = 99;

  void _incrementCounter() {
    setState(() {
      if (_counter < 100) {
        _counter++;
      } else {
        showDialog(
            context: context,
            builder: (context) {
              return const AlertDialog(
                content: Text('100以上は押せません'),
              );
            });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'カウント数:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
