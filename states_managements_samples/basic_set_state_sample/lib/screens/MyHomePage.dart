import 'package:flutter/material.dart';
import 'package:set_state_sample/screens/MySecondPage.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage(
      {super.key,
      required this.title,
      required this.counter,
      required this.decrementCounter,
      required this.incrementCounter});

  final String title;
  final int counter;
  final ValueChanged<void> decrementCounter;
  final ValueChanged<void> incrementCounter;

  @override
  State<StatefulWidget> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _onPressed() {
    widget.incrementCounter(null);
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
            const Text('You have pushed the button this many times:'),
            Text(
              widget.counter.toString(),
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            ElevatedButton(
              child: const Text('Next Screen'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MySecondPage(
                      widget.decrementCounter,
                      title: 'My Second Page',
                      counter: widget.counter,
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _onPressed,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
