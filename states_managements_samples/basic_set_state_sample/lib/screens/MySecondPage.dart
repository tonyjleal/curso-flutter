import 'package:flutter/material.dart';

class MySecondPage extends StatefulWidget {
  const MySecondPage(this.decrementCounter,
      {super.key, required this.title, required this.counter});

  final String title;
  final int counter;
  final ValueChanged<void> decrementCounter;

  @override
  State<StatefulWidget> createState() => _MySecondPageState();
}

class _MySecondPageState extends State<MySecondPage> {
  void onPressed() {
    widget.decrementCounter(null);
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
            const Text('You have pushed the button this many times :'),
            Text(
              super.widget.counter.toString(),
              style: Theme.of(context).textTheme.displayMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: onPressed,
          tooltip: 'Decrement',
          backgroundColor: Colors.red,
          child: const Icon(Icons.indeterminate_check_box)),
    );
  }
}
